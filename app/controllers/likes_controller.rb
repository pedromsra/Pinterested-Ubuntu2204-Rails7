class LikesController < ApplicationController
    def unlike
        @pins = Pin.all.find(params[:id])
        @like = Like.find_by(pin_id: params[:id], user_id: current_user.id)
		@like.destroy
		redirect_to pin_path(@pins)
	end
end
