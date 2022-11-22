class PasswordMailer < ApplicationMailer

  def reset
    @user = params[:user]
  
    @token = @user.signed_id(expires_in: 24.hours, purpose: 'password_reset')

    # mail to: "Joliesameh@icloud.com"
    mail to: @user.email

  end

  def confirm
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
end
