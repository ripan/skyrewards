class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ArgumentError, with: :show_argument_errors
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    @response_obj = {:text => "Invalid account number exception", :message =>  "The supplied account number is invalid"}
    respond_to do |format|
      format.js { render :file => "/eligibility/check.js.erb"}
      format.html { render controller: "eligibility", action: "check", locals: {response_obj: @response_obj}  }
      format.json { render json: @response_obj }
    end
  end


  def show_argument_errors
    @response_obj = {:text => "CUSTOMER_INELIGIBLE", :message =>  "Customer is not eligible"}
    respond_to do |format|
      format.js { render :file => "/eligibility/check.js.erb"}
      format.html { render controller: "eligibility", action: "check", locals: {response_obj: @response_obj}  }
      format.json { render json: @response_obj }
    end
  end


end
