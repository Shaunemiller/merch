class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def product_params
		#whitelisted form data
	end

	def find_product
		#query to read a record from the DB
	end

end
