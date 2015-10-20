class DanielTest < ApplicationMailer

	def fake_email

		mail to: nordbydaniel@gmail.com, from: 'sanjiv@tulipclean.com', subject: 'THIS IS A TEST'
	end
end
