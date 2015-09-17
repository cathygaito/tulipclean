require 'test_helper'

class PrelaunchMailerTest < ActionMailer::TestCase
  test "welcome_email" do
  	user = User.first
    mail = PrelaunchMailer.welcome_email(user)
    assert_equal "Welcome to Tulip!", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["nordbydaniel@gmail.com"], mail.from
    assert_match "You have successfully signed up for Tulip. See your referal code below.", mail.body.encoded
  end
end
