class PinsController < ApplicationController
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
	
	private
	
	def pin_params
		params.require(:pin).permit(:title, :description)
	end
end