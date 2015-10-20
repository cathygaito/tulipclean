namespace :emails do
  desc "This task does nothing"
  task triggered: :environment do

    @preuser = Preuser.all
    @preuser.each do |user| 
    	@updated_date = user.updated_at
    	@current_date
    	@created_date = user.created_at
    	puts user.email
    	puts @created_date.to_date
    	puts @updated_date.to_date
    	puts 
    	count = user.referrals.length

    	if @created_date == @updated_date
    		DanielTest.fake_email.deliver_now
    	else
    		if count == 5
    			DanielTest.fake_email.deliver_now	
    		elsif count == 10
    		elsif count == 25
    		elsif count == 50
    	
    		end
    	end

    	
    end
  end
end
