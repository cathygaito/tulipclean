namespace :emails do
  desc "This task does nothing"
  task triggered: :environment do

    @preuser = Preuser.all
    @preuser.each do |user| 
    	@updated_date = user.updated_at
    	@created_date = user.created_at
    	puts user.email
    	puts @created_date.to_date
    	puts @updated_date.to_date
    end
  end
end
