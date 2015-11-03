class StaticPagesController < ApplicationController
  before_action :skip_first_page, only: [:prehome]

  def home
  end

  def prehome
    @is_mobile = mobile_device?
    @preuser = Preuser.new
    if request.path_info == '/alonzohome'
      render 'alonzo'
    end
  end

  def about
  end

  private 

    def skip_first_page
        if !Rails.application.config.ended
            email = cookies[:h_email]
            if email and !Preuser.find_by_email(email).nil?
                redirect_to ('/' + get_url)
            else
                cookies.delete :h_email
            end
        end
    end

    def get_url
      subarray = ['prelaunch','pre-launch','prelauncher','pre-launcher','pre-launchr','launcher','prelaunchr','launchr','alpha']
      random = rand(8)
      subdomain = subarray[random].to_s
      return subdomain
    end
end
