class PinsController < ApplicationController

	before_action :authenticate_user!, except:[:index, :show]
	before_action :correct_user?, only:[:edit, :update, :destroy]

	def index
		@pins = Pin.all
	end
	
	def show
		@pins = Pin.find(params[:id])
	end
	
	def new
		@pins = current_user.pins.build
	end
	
	def create
		@pins = current_user.pins.build(pin_params)
		
		if @pins.save
			redirect_to @pins, notice: "Pin criado com sucesso"
		else
			render :new
		end
	end
	
	def edit
		@pins = Pin.find(params[:id])
	end
	
	def update
		@pins = Pin.find(params[:id])
		
		if @pins.update(pin_params)
			redirect_to @pins, notice: "Pin alterado com sucesso"		
		else
			reder :edit, status: :unprocessable_entity
		end
	end
	
	def destroy
		@pins = Pin.find(params[:id])
		@pins.destroy

		redirect_to root_path, status: :see_other, notice: "Pin removido com sucesso"
	end

	def like
		@pins = Pin.all.find(params[:id])
		Like.create(pin_id: @pins.id, user_id: current_user.id)
		redirect_to pin_path(@pins)
	end
	
	private
	
	def pin_params
		params.require(:pin).permit(:title, :description)
	end

	def correct_user?
        @pins = current_user.pins.find_by(id: params[:id])
        redirect_to pin_path, notice: "Not authorized to edit this pin" if @pins.nil?
    end
end