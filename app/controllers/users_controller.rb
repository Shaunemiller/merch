class UsersController < ApplicationController
  	
before_action :find_user, {only:
										[:show, :edit, :update, :destroy	]

								}


  def show
  end

  def new
  	@user = User.new
  end

  def create
  		@user = User.new(user_params)
  		if @user.save
  		flash[:success] = "'#{@user.email}' profile was created."
		redirect_to user_path(@user)

		else
			flash[:error] = "Oops, something went wrong, check the form and try again."
			render :new
		end
  end

  def edit
  end

  def update
  	if @user.update(user_params
			)
			flash[:success] = "'#{@user.email}' was updated successfully."
			redirect_to user_path(@user)
		else
			flash[:error] = "Oops, something went wrong, check the form and try again."
			render :edit
		end

  end

  def destroy
  	@user.destroy
		flash[:success] = "'#{@user.email}' was deleted."
		@user = nil
		redirect_to root_path
  end


  private
  def user_params

  	params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def find_user
  		@user = User.find(params["id"])
  	end





  

end
