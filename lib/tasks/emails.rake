namespace :emails do
  desc "Send out summary emails"
  task triggered: :environment do

    @preuser = Preuser.all
    @preuser.each do |user| 
    	@created_date = user.created_at.to_date
    	@current_date = Time.new.to_date
    	@updated_date = user.updated_at.to_date
        count = user.referrals.count
    	puts user.email
    	puts "#{@created_date} - created"
    	puts @updated_date
    	puts @current_date
    	puts count

    	if @updated_date == @current_date
    		if count == 5
    			PrelaunchMailer.five_email(user).deliver_now	
    		elsif count == 10
    			PrelaunchMailer.ten_email(user).deliver_now
    		elsif count == 25
    			PrelaunchMailer.twentyfive_email(user).deliver_now
    		elsif count == 50
    			PrelaunchMailer.fifty_email(user).deliver_now
    		end
    	end
    end
  end
end
