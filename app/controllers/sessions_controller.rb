class SessionsController < ApplicationController
  def new
  end


  def create
  # get email from params
  email = params[:session][:email]
  # get password from params 
  password = params[:session][:password]
  # Get User from DB using email from params
  @user = User.find_by(email: email)
  # compare pw from params with pw from db
  if @user.present? and @user.authenticate(password)
    # login
    # unset any session data (in case of session hijacking)
    reset_session

    #log the user in 
    session[:user_id] = @user.id
    
    #tell them it worked
    flash[:success] = "Welcome back #{@user.email}."
 	 
    #send them home
 	redirect_to root_path
  else
  	#tell them it didn't work
  	flash[:error] = "Sorry it didn't work!"
 	
 	 render :new
  
  end
  

 end
          

          def destroy
          reset_session
          flash[:success] = "See you soon!"
          redirect_to root_path

          end









end
