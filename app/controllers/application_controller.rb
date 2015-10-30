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

	protected

    def ref_to_cookie
        if params[:ref] && !Rails.application.config.ended
            if !Preuser.find_by_referral_code(params[:ref]).nil?
                cookies[:h_ref] = { value: params[:ref], expires: 1.month.from_now }
            end
        end
    end

end
