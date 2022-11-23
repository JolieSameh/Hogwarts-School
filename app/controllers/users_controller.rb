class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
    end

    # GET /users or /users.json
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
      puts @user.inspect
      puts "pppp"
      # @user.destroy
      # redirect_to user_path, notice: "Wizard was successfully destroyed." 
    end
  
    def admin_edit
      @user = User.find(params[:id])
    end

    # PATCH/PUT /users/1 or /users/1.json
    def admin_update
      @user = User.find(params[:id])
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "Wizard was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :admin_edit, status: :unprocessable_entity }
          format.json { render @user.errors, status: :unprocessable_entity }
        end
      end
    end
    def user_params
      params.require(:user).permit(:relatives, :email, :password, :password_confirmation, :name, :house, :bio, :birthday)
    end
end

