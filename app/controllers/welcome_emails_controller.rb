class WelcomeEmailsController < ApplicationController
    def new
    end
    def create 
        @user = User.find(params[:id])

        #Send email
        WelcomeMailer.with(user: @user).congrats.deliver_later
    end
end
