class PreusersController < ApplicationController
  before_action :ref_to_cookie, only: [:create]

  def new
  end

  def create
  	# Get user to see if they have already signed up
        @preuser = Preuser.find_by_email(params[:preuser][:email].downcase);
            
        # If user doesnt exist, make them, and attach referrer
        if @preuser.nil?


            @preuser = Preuser.new(:email => params[:preuser][:email], :referrer_id => params[:preuser][:referrer_id])

            puts '------------'
            puts params[:preuser][:email].inspect
            puts '------------'

            if @preuser.save
                refering_preuser = Preuser.find_by_referral_code(@preuser.referrer_id)
                refering_preuser.referrals.push(@preuser.referral_code).flatten unless refering_preuser.nil?
                refering_preuser.save unless refering_preuser.nil?
                PrelaunchMailer.welcome_email(@preuser).deliver_now
            end
        end

        # Send them over refer action
        respond_to do |format|
            if !@preuser.nil?
                cookies[:h_email] = @preuser.email
                format.html { redirect_to get_url }
            else
                format.html { redirect_to root_path  }
            end
        end
  end

  def refer
    email = cookies[:h_email]
    @is_mobile = mobile_device?
    @preuser = Preuser.find_by_email(email)
    if @preuser.nil?
        @count = 0
    else
        @count = @preuser.referrals.count
    end

    if request.path_info == '/alonzorefer'
      @preuser = Preuser.find_by_email('nordbydaniel@gmail.com')
      @count = 25
      render 'alonzo'
    elsif request.path_info == '/alpha'
      render 'alpha'
    elsif request.path_info == '/launcher'
      render 'launcher'
    elsif request.path_info == '/launchr'
      render 'launchr'
    elsif request.path_info == '/pre-launch'
      render 'pre-launch'
    elsif request.path_info == '/pre-launcher'
      render 'pre-launcher'
    elsif request.path_info == '/pre-launchr'
      render 'pre-launchr'
    elsif request.path_info == '/prelaunch'
      render 'prelaunch'
    elsif request.path_info == '/prelauncher'
      render 'prelauncher'
    elsif request.path_info == '/prelaunchr'
      render 'prelaunchr'
    end

    
  end

  private

    
  def preuser_params
  	params.require(:preuser).permit(:id, :email, :referral_code, :referrer_id, :referrals, :created_at, :updated_at)
  end
end
