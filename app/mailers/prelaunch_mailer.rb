class PrelaunchMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.prelaunch_mailer.welcome_email.subject
  #
  def welcome_email(preuser)
    @preuser = preuser

    mail to: preuser.email, subject: 'Welcome to Tulip!'
  end
end
