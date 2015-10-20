namespace :emails do
  desc "This task does nothing"
  task triggered: :environment do

    @preuser = Preuser.all
    @preuser.each do |user| 
    	@created_date = user.created_at
    	@current_date = Time.new.to_date
    	@updated_date = user.updated_at
    	puts user.email
    	puts @created_date.to_date
    	puts @updated_date.to_date
    	puts @current_date
    	count = user.referrals.length

    	if @created_date == @updated_date
    		DanielTest.fake_email.deliver_now
    	elsif @updated_date == @current_date
    		if count == 5
    			DanielTest.five_email.deliver_now	
    		elsif count == 10
    			DanielTest.ten_email.deliver_now
    		elsif count == 25
    			DanielTest.twentyfive_email.deliver_now
    		elsif count == 50
    			DanielTest.fifty_email.deliver_now
    		end
    	end	
    end
  end
end
