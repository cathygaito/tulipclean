class PrelaunchMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.prelaunch_mailer.welcome_email.subject
  #
  def welcome_email(preuser)
    @preuser = preuser

    mail to: preuser.email, from: 'Sanjiv and Cathy at Tulip<founders@tulipclean.com>', subject: 'Welcome to Tulip!'
  end

  def five_email(preuser)
  	@preuser = preuser

    mail to: preuser.email, from: 'Sanjiv and Cathy at Tulip<founders@tulipclean.com>', subject: 'You’ve earned free Tulip products!'
  end

  def ten_email(preuser)
  	@preuser = preuser

    mail to: preuser.email, from: 'Sanjiv and Cathy at Tulip<founders@tulipclean.com>', subject: 'You’ve earned free Tulip products!'
  end

  def twentyfive_email(preuser)
  	@preuser = preuser

    mail to: preuser.email, from: 'Sanjiv and Cathy at Tulip<founders@tulipclean.com>', subject: 'You’ve earned free Tulip products!'
  end

  def fifty_email(preuser)
  	@preuser = preuser

    mail to: preuser.email, from: 'Sanjiv and Cathy at Tulip<founders@tulipclean.com>', subject: 'Wow - just wow.'
  end

  def launch_email(preuser)
  	@preuser = preuser

  	mail to: preuser.email, from: 'Sanjiv and Cathy at Tulip<founders@tulipclean.com>', subject: 'Make the best of this week!'
  end
end
