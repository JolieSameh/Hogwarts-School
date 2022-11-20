class RelationshipsController < ApplicationController

    def create
        relatioship = Relatioship.new(relatioship_params)
        relatioship.follower_id = current_user
        relatioship.save
        redirect_to users_path
    end

    def relatioship_params
        params.require(:relatioship).permit(:followee_id)
    end
end
