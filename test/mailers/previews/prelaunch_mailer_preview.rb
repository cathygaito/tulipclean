# Preview all emails at http://localhost:3000/rails/mailers/prelaunch_mailer
class PrelaunchMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/prelaunch_mailer/welcome_email
  def welcome_email
  	user = Preuser.first
    PrelaunchMailer.welcome_email(user)
  end

  def five_email
  	user = Preuser.first
    PrelaunchMailer.five_email(user)
  end

  def ten_email
  	user = Preuser.first
    PrelaunchMailer.ten_email(user)
  end
  def twentyfive_email
  	user = Preuser.first
    PrelaunchMailer.twentyfive_email(user)
  end
  def fifty_email
  	user = Preuser.first
    PrelaunchMailer.fifty_email(user)
  end

end
