class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :destroy, :show]
	
	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)
		if @user.save
		flash[:notice] = "Account was successfully created"
			redirect_to user_path(@user) # change to articles_opath
		else
			render :new
		end
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Account was successfully updated"
			redirect_to user_path(@user) # change to articles_path
		else
			render :edit
		end

		
	end

	def destroy
		@user.destroy
		flash[:notice] = "Account was successfuly deleted"
		redirect_to users_path
	end

	def show
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

end