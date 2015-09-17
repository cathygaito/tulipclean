class PrelaunchMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.prelaunch_mailer.welcome_email.subject
  #
  def welcome_email(user)
    @user = user

    mail to: user.email, subject: 'Welcome to Tulip!'
  end
end
