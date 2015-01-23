class ProductsController < ApplicationController
	before_action :find_product, only:
										[:show, :edit, :update, :destroy]

								

	before_action :require_user, only: [:new, :create]
	before_action :require_owner, only: [:edit, :update, :destroy]

	def index
		#This is publicly available
		@products = Product.all
	end

	def show
		#This is publicly available
		
	end

	def new
		# only logged in users
		#require_user
		@product = current_user.products.new
	end

	def create
		# only for logged in users
		#require_user
		@product = current_user.products.new(product_params)

			if @product.save
				flash[:success] = "'#{@product.name}' was added to the shop."
				redirect_to product_path(@product)

			else
				flash[:error] = "Oops, something went wrong, check the form and try again."
				render :new
			end
	end

	def edit
		#only logged in Users and User is owner
		#require_owner(@product)
	end

	def update
		#only logged in Users and User is owner
		#require_owner(product)
		if @product.update(product_params
			)
			flash[:success] = "'#{@product.name}' was updated successfully."
			redirect_to product_path(@product)
		else
			flash[:error] = "Oops, something went wrong, check the form and try again."
			render :edit
		end
	end

	def destroy
		#only logged in Users and User is owner
		@product.destroy
		#require_owner(product)
		flash[:success] = "'#{@product.name}' was deleted from the shop."
		@product = nil
		redirect_to root_path
	end

	private
	def product_params
		#whitelisted form data
		# grabs form data
		params.require(:product).permit(:name, :description, :price_in_pence, :image)
		
	end

	def find_product
		#query to read a record from the DB
		@product = Product.find(params["id"])
	end

	# Define an action that checks for users 
	# and makes sure the user owns something

	def require_owner
		# check for current_user?
		if current_user?
			# use current_user to look for belongings
			# Compare product parameter
			unless @product.user == current_user
				flash[:error] = "You can only edit products you own."
				redirect_to root_path and return
			end
		else
			flash[:error] = "You must be logged in to do that."
			redirect_to new_session_path and return
		end
	end


end
