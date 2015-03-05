module CustomErrors
  private

  def record_not_found
    @response_obj = {:text => "Invalid account number exception", :message =>  "The supplied account number is invalid"}
    render_response(@response_obj)
  end

  def show_argument_errors
    @response_obj = {:text => "CUSTOMER_INELIGIBLE", :message =>  "Customer is not eligible"}
    render_response(@response_obj)
  end

  def render_response response_obj
    @response_obj = response_obj
    respond_to do |format|
      format.js { render :file => "/eligibility/check.js.erb"}
      format.html { render controller: "eligibility", action: "check", locals: {response_obj: @response_obj}  }
      format.json { render json: @response_obj }
    end
  end
  
end
