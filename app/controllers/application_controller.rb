class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?, :user_owns? 


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

	def require_user
		unless current_user?
			flash[:error] = "You must be logged in to do that."
			redirect_to new_session_path and return
		end
	end



	def user_owns? (product)
		product.user == current_user
		
	end


end
