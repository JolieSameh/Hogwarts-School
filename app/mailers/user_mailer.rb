# app/mailers/user_mailer.rb
class UserMailer < Devise::Mailer
    # include Devise::Controllers::UrlHelpers
    # default template_path: 'devise/mailer'

    def account_activation(user)
      @user = user
      mail to: user.email, subject: "Account activation"
    end
  
    def password_reset(user)
      ser = user
      mail to: user.email, subject: "Password reset"
    end
end
