class PreusersController < ApplicationController
  def new
  end

  def create
  	# Get user to see if they have already signed up
        @preuser = Preuser.find_by_email(params[:preuser][:email]);
            
        # If user doesnt exist, make them, and attach referrer
        if @preuser.nil?

            cur_ip = IpAddress.find_by_address(request.env['HTTP_X_FORWARDED_FOR'])

            if !cur_ip
                cur_ip = IpAddress.new(
                    :address => request.env['HTTP_X_FORWARDED_FOR'],
                    :count => 0
                )
            end

            if cur_ip.count > 2
                return redirect_to root_path
            end

            @preuser = Preuser.new(:email => params[:preuser][:email])

            @referred_by = Preuser.find_by_referral_code(cookies[:h_ref])

            puts '------------'
            puts @referred_by.email if @referred_by
            puts params[:preuser][:email].inspect
            puts request.env['HTTP_X_FORWARDED_FOR'].inspect
            puts '------------'

            if !@referred_by.nil?
                @preuser.referrer = @referred_by
            end

            if @preuser.save
                cur_ip.count = cur_ip.count + 1
                cur_ip.save
            end
        end

        # Send them over refer action
        respond_to do |format|
            if !@preuser.nil?
                cookies[:h_email] = { :value => @preuser.email }
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
  	params.require(:preuser).permit(:id, :email, :referral_code, :referrer_id, :created_at, :updated_at)
  end
end
