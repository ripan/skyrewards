require 'custom_errors'
class ApplicationController < ActionController::Base
  include CustomErrors
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ArgumentError, with: :show_argument_errors
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

end
