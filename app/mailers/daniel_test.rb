class DanielTest < ApplicationMailer

	def fake_email
		mail to: 'nordbydaniel@gmail.com', from: 'founders@tulipclean.com', subject: 'THIS IS A TEST'
	end

	def five_email
	end

	def ten_email
	end

	def twentyfive_email
	end

	def fifty_email
	end
end
