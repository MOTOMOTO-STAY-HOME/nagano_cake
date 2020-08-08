class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  	@customer = current_customer
  end

  def edit
  	@customer = current_customer
  end

  def update
  	@customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "会員情報が変更されました。"
      redirect_to customers_url
    else
      render :edit
    end
  end

  def last_confirm
  end

  def hide
    customer = current_customer
    customer.update(is_active: false)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

    private
      def customer_params
        params.require(:customer).permit(:last_name, :first_name, :kana_first_name, :kana_last_name, :email, :postal_code, :address, :phone)
      end
end
