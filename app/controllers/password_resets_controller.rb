class PasswordResetsController < ApplicationController
    def new
    end
    def create 
        @user = User.find_by email: params[:email]
        if @user.present?
            #Send email
            PasswordMailer.with(user: @user).reset.deliver_later
            redirect_to root_path, notice: "An email was sent with a link to reset your password."
        else
            redirect_to passwords_reset_path, notice: "Please enter a valid email."
        end
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to new_user_session_path, alert: 'Your token has expired. Please try again'
    end
    def update
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
        if @user.update(password_params)
          redirect_to new_user_session_path, notice: 'Your password was reset succesfully. Please sign in.'
        else
          render 'edit'
        end
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to new_user_session_path, alert: 'Your token has expired. Please try again'
    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end