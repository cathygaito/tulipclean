class StaticPagesController < ApplicationController
  before_action :skip_first_page, only: [:prehome]

  def home
  end

  def prehome
    @is_mobile = mobile_device?
    @preuser = Preuser.new
    if request.path_info == '/prelaunch'
      render 'prelaunch'
    elsif request.path_info == '/pre-launch'
      render 'pre-launch'
    elsif request.path_info == '/prelauncher'
      render 'prelauncher'
    elsif request.path_info == '/pre-launcher'
      render 'pre-launcher'
    elsif request.path_info == '/pre-launchr'
      render 'pre-launchr'
    elsif request.path_info == '/launcher'
      render 'launcher'
    elsif request.path_info == '/prelaunchr'
      render 'prelaunchr'
    elsif request.path_info == '/launchr'
      render 'launchr'
    elsif request.path_info == '/alpha'
      render 'alpha'
    elsif request.path_info == '/alonzohome'
      render 'alonzo'
    elsif request.path_info == '/'
      render get_url
    end
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

    def get_url
      subarray = ['prelaunch','pre-launch','prelauncher','pre-launcher','pre-launchr','launcher','prelaunchr','launchr','alpha']
      random = rand(8)
      subdomain = subarray[random].to_s
      return subdomain
    end
end
