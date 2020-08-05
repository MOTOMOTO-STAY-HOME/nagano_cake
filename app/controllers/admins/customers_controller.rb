class Admins::CustomersController < Admins::ApplicationControllerController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(admins_customer_params)
      redirect_to admins_customer_path(@customer.id)
    else
      render "edit"
    end
  end

private
def admins_customer_params
  params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :address, :phone, :is_active)
end

end
