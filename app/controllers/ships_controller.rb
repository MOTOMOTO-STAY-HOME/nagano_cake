class ShipsController < ApplicationController
	before_action :authenticate_customer!
	before_action :ensure_correct_customer, only:[:edit, :update, :destroy]


  def index
  	@ships = Ship.where(customer_id: current_customer.id).page(params[:page]).reverse_order
  	@ship = Ship.new
  end

  def create
  	@ship = current_customer.ships.build(ship_params)
  	if @ship.save
  		flash[:success]= "新しい配送先が登録されました。"
  		redirect_to ships_url
  	else
  		flash.now[:danger]= "必須項目を正しく入力してください。"
  		@ships = Ship.where(customer_id: current_customer.id).page(params[:page]).reverse_order
  		render :index
  	end
  end

  def edit
  	@ship = Ship.find(params[:id])
  end

  def update
  	@ship = Ship.find(params[:id])
  	if @ship.update(ship_params)
  		flash[:success]= "配送先が変更されました。"
  		redirect_to ships_url
  	else
  		flash.now[:danger]= "必須項目を正しく入力してください。"
  		render :edit
  	end
  end

  def destroy
  	Ship.find(params[:id]).destroy
  	redirect_to ships_path
  end

  		protected

    		def ship_params
    			params.require(:ship).permit(:name, :postal_code, :address)
    		end

  		private

    		def ensure_correct_customer
    			@ship = Ship.find(params[:id])
    			unless @ship.customer == current_customer
    				redirect_back(fallback_location: root_url)
    			end
    		end
end
