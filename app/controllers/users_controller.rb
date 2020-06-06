class UsersController < ApplicationController
	before_action :login?, only: [:show]

	def show
		@user = User.find_by id: params[ :id]
	end

	def new
		@user = User.new
	end

	def create
		#@user = User.new
		#render :new
		@user = User.new user_params
		if @user.save
			flash[:success] = "Create account Success!!"
			redirect_to @user
		else 
			flash.now[:danger] = "Error: Create account fail!!"
			render :new 
		end
	end

	private
	def user_params
		params.require(:user).permit :name, :email, :password, :password_confirmation
	end

end
