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
                format.html { redirect_to '/refer-a-friend' }
            else
                format.html { redirect_to root_path  }
            end
        end
  end

  def refer
    email = cookies[:h_email]
    if email.nil?
      redirect_to root_path
    else
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
      end
    end
    
  end

  private

    
  def preuser_params
  	params.require(:preuser).permit(:id, :email, :referral_code, :referrer_id, :referrals, :created_at, :updated_at)
  end
end
