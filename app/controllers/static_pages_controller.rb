class StaticPagesController < ApplicationController
  before_action :skip_first_page, only: [:prehome]

  def home
  end

  def prehome
  	@preuser = Preuser.new
  end

  def about
  end

  private 

    def skip_first_page
        if !Rails.application.config.ended
            email = cookies[:h_email]
            if email and !Preuser.find_by_email(email).nil?
                redirect_to '/refer-a-friend'
            else
                cookies.delete :h_email
            end
        end
    end
end
