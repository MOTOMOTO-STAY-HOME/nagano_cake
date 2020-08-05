class Admins::ProductsController < ApplicationController
  def new
  end

  def index
    @products = Product.all
    # @genere = Genere.all
  end

  def show
  end

  def edit
  end
end
