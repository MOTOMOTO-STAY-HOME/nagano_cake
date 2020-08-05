class Admins::ProductsController < ApplicationController
  def new
  end

  def index
  	@products = Product.all
  end

  def show
  end

  def edit
  end
end
