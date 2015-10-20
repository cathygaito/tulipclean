class DanielTest < ApplicationMailer

	def fake_email
		mail to: 'nordbydaniel@gmail.com', from: 'sanjiv@tulipclean.com', subject: 'THIS IS A TEST'
	end

	def five_email
		mail to: 'nordbydaniel@gmail.com', subject: 'TEST 5'
	end

	def ten_email
		mail to: 'nordbydaniel@gmail.com', subject: 'TEST 10'
	end

	def twentyfive_email
		mail to: 'nordbydaniel@gmail.com', subject: 'TEST 25'
	end

	def fifty_email
		mail to: 'nordbydaniel@gmail.com', subject: 'TEST 50'
	end
end
