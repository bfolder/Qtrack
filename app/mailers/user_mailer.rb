class UserMailer < ActionMailer::Base
  def welcome_email(user, request)
    @user = user
    @url = request.protocol.to_s + request.host_with_port.to_s
    mail(to: @user.email, subject: 'Welcome to Qtrack')
  end
end