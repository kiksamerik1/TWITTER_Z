class ZombiesController < ApplicationController
	
	def index
		@zombies = Zombie.all
		respond_to do |format|
			format.html
			format.xml { render :xml => @zombies}
			format.json { render :json => @zombies}  
		end	
	end

	def show
		@zombie = Zombie.find params[:id]
	end

	def new
		@zombie = Zombie.new
	end

	def edit
		@zombie = Zombie.find(params[:id])
	end

	def create
		Zombie.create(params[:zombie])
		redirect_to zombies_path	
	end

	def update
		@zombie=Zombie.find(params[:id])
		@zombie.update_attributes(params[:zombie])
		redirect_to zombies_path
	end

	def destroy
		@zombie = Zombie.find(params[:id])
		@zombie.destroy
		redirect_to zombies_path
	end	
end