class UsersController < ApplicationController
    # after_action :set_house, only: [:create]
    def show
    end
    
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_back(fallback_location: user_path(@user))
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

  # private
  # def set_house

  #   current_user.update(house: "Ravenclaw")
  #   # @user.house = "Ravenclaw"
  #   # ["Gryffindor", "Hufflepuff", "Slytherin", "Ravenclaw"].sample

  # end


  # def create
  #   @user = User.new(user_params)
  #   @user.house = "Ravenclaw"

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to user_url(@user), notice: "User was successfully created." }
  #       format.json { render :show, status: :created, location: @user }

  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end

end
