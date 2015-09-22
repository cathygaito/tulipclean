class PreusersController < ApplicationController
  before_action :ref_to_cookie, only: [:create]

  def new
  end

  def create
  	# Get user to see if they have already signed up
        @preuser = Preuser.find_by_email(params[:preuser][:email]);
            
        # If user doesnt exist, make them, and attach referrer
        if @preuser.nil?

            cur_ip = IpAddress.find_by_address(request.remote_ip)

            if !cur_ip
                cur_ip = IpAddress.new(
                    :address => request.remote_ip,
                    :count => 0
                )
            end

            if cur_ip.count > 2
                return redirect_to root_path
            end

            @preuser = Preuser.new(:email => params[:preuser][:email], :referrer_id => params[:preuser][:referrer_id])

            puts '------------'
            puts params[:preuser][:email].inspect
            puts request.remote_ip.inspect
            puts '------------'

            if @preuser.save
                cur_ip.count = cur_ip.count + 1
                cur_ip.save
                PrelaunchMailer.welcome_email(@preuser).deliver_now
            end
        end

        # Send them over refer action
        respond_to do |format|
            if !@preuser.nil?
                cookies[:h_email] = @preuser.email
                format.html { redirect_to '/refer-a-friend' }
            else
                format.html { redirect_to root_path, :alert => "Something went wrong!" }
            end
        end
  end

  def refer
        email = cookies[:h_email]

        @is_mobile = mobile_device?

        @preuser = Preuser.find_by_email(email)

        @count = 0
        Preuser.all.each do |referrals|
            if referrals.referrer_id == @preuser.referral_code
                @count =+ 1
            end
        end

        respond_to do |format|
            if !@preuser.nil?
                format.html #refer.html.erb
            else
                format.html { redirect_to root_path, :alert => "Something went wrong!" }
            end
        end
    end

  private

  def preuser_params
  	params.require(:preuser).permit(:id, :email, :referral_code, :referrer_id, :referrals, :created_at, :updated_at)
  end
end
