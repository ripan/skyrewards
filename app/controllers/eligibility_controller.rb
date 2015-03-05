class EligibilityController < ApplicationController
  def check
    @response_obj = {}

    @customer = Customer.includes(:channels => [:rewards]).find(params[:id])
    @rewards = []
    @customer.channels.each do |channel|
      channel.rewards.each do |reward|
        @rewards << reward.name
      end
    end

    raise ArgumentError.new('Customer is not eligible') if @rewards.empty?

    @response_obj = {:text => "CUSTOMER_ELIGIBLE",:message => @rewards}
    respond_to do |format|
      format.js
      format.html { render action: "check" }
      format.json { render json: @response_obj, status: :unprocessable_entity }
    end
  end
end
