class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?


	#look for User using session data
	def current_user
		# if there is session data, use it to lookup User
		# if session[:user_id].present?
		if session[:user_id].present?	
		User.find(session[:user_id])
		end
	end

	def current_user?
		current_user.present?
	end


end
