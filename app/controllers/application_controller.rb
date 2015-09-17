class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  include SessionsHelper
  include OrdersHelper
  require "stripe"

	def mobile_device?
		if session[:mobile_param]
			session[:mobile_param] == "1"
		else
			request.user_agent =~ /Mobile|webOS/
		end
	end
	
end
