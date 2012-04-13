class ZombiesController < ApplicationController

	before_filter :find_zombie, :only => [:show, :edit, :update, :destroy]
	
	def find_zombie
		@zombie = Zombie.find params[:id]
	end

	def index
		@zombies = Zombie.all
		respond_to do |format|
			format.html
			format.xml { render :xml => @zombies}
			format.json { render :json => @zombies}  
		end	
	end	
	
	def show
	end

	def edit
	end

	def new
		@zombie = Zombie.new
	end

	def create
		@zombie = Zombie.new(params[:zombie])
		if @zombie.save
			flash[:notice] = "#{@zombie.name} was successfully added!"	
			redirect_to zombies_path
		else
			render :action=>'new'
		end		
	end

	def update
		@zombie.update_attributes!(params[:zombie])
		flash[:notice] = "#{@zombie.name} was successfully updated!"
		redirect_to zombie_path(@zombie)
	end

	def destroy
		@zombie.destroy
		flash[:notice] = "Zombie '#{@zombie.name}' deleted."
		redirect_to zombies_path
	end

end