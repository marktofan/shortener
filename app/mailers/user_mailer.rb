class UserMailer < ActionMailer::Base
  default from: "petru.ilies@softvision.ro"
  layout 'mailer'

  def welcome(user)

    @user = user
    @url = "http://example.com/sign_in"

    mail(:to => user.email, :subject => "Welcome to Shortener")
  end


end
