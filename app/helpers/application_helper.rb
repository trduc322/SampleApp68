module ApplicationHelper

	def login_user user
		session[:user_id] = user.id
	end

	def current_user
		#@current_user = @current_user || User.find_by id: session[:user_id]
		@current_user ||= User.find_by id: session[:user_id]
	end

	def login? 
		return if current_user
			flash[:danger] ="Moi ban login"
			redirect_to login_path
	end
end
