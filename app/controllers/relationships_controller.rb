class RelationshipsController < ApplicationController

    # def create
    #     relatioship = Relatioship.new(relatioship_params)
    #     relatioship.follower_id = current_user
    #     relatioship.save
    #     redirect_to users_path
    # end

    def create
        relatioship = Relatioship.new(relatioship_params)
        relatioship.follower_id = current_user
        relatioship.save
        redirect_to wizards_path
    end
    private
    def current_user
    return 1 # get it later from session
    end
    def relatioship_params
        params.require(:relatioship).permit(:following_id)
    end
end
