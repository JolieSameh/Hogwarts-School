class UsersController < ApplicationController

    def show
    end

    # GET /spells or /spells.json
    def index
        @users = User.all
    end
    
    def follow
        @user = User.find(params[:id])
        current_user.followees << @user
        redirect_back(fallback_location: user_path(@user))
    end
    
    def unfollow
        @user = User.find(params[:id])
        current_user.followed_users.find_by(followee_id: @user.id).destroy
        redirect_back(fallback_location: user_path(@user))
    end

    def delete_image
      image = ActiveStorage::Attachment.find(params[:image_id])
      if current_user ==image.record
        image.purge
        redirect_back(fallback_location: user_path(@user))
      else
        redirect_to root_path
      end
    end
    def delete_user
      @user = User.find(params[:id])
      @user.destroy
      redirect_to user_path, notice: "Wizard was successfully destroyed." 
    end
  end

