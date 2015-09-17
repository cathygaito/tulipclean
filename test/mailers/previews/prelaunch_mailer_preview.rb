# Preview all emails at http://localhost:3000/rails/mailers/prelaunch_mailer
class PrelaunchMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/prelaunch_mailer/welcome_email
  def welcome_email
  	user = User.first
    PrelaunchMailer.welcome_email(user)
  end

end
