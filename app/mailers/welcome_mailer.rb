class WelcomeMailer < ApplicationMailer

  def congrats

    @user = current_user
    mail to: @user.email_address

  end
end
