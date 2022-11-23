class UserMailerPreview < ActionMailer::Preview
    def reset_password_instructions
        UserMailer.reset_password_instructions(User.first)
    end
    def password_reset
      user = User.first
      user.reset_token = User.new_token
      UserMailer.password_reset(user)
    end
end