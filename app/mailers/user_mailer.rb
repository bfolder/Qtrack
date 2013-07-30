class UserMailer < ActionMailer::Base
  def send_welcome_email(admin, user)
    mail(to: user.email, from: admin.email, subject: 'Welcome to Qtrack')
  end
end