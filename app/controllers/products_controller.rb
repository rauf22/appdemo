class ProductsController < ApplicationController
	before_action :authenticate_user!,  only: [:show, :edit, :update, :destroy]
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	def index
		@products = Product.all
		
	end
	def show
		
		
	end
	def new
		@product = Product.new
		
	end
	def edit
		
	end
	def create
		@product = Pruct.create(product_params)
		if @product.errors.empty?
			redirect_to product_path(@product)
		else
			render "new"
		end
		
	end
	def update
		@product.update_attributes(product_params)
		if @product.errors.empty?
			redirect_to product_path(@product)
		else
			render "edit"
		end		
		
	end
	def destroy
		
	end
private
	def set_product
		@product = Product.find(params[:id])
		
	end

	def product_params
		params.require(:product).permit(:title, :description, :price)

		
	end
end
