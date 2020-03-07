class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = customer.new #generate data blank to create new form
  end

  def create
    @customer = customer.new(customer_params)
    #render json: @customer #test when submit button form
    if @customer.save
      flash[:notice] = "new customer created"
      redirect_to controller: 'pages', action: "index"
    else
      flash[:notice] = "account not created "
      redirect_to action:"new"
    end
  end

  def edit
  end
  #for get params when click submit form
  
  private
  def customer_params
    #params.require(name model)
    params.require(:customer).permit(:Full_Name,:Phone_Number,:Company_Name,:Email,:Building_Type,:Nb_Appartement,:Nb_Company,:Nb_Business,:Nb_Floor,:Nb_Basement,:Nb_Parking,:Nb_Cage,:Nb_OccupantPerFloor,:Product_Grade,:Nb_Ele_Suggested,:Price_Per_Ele,:Subtotal,:Install_Fee,:Final_Price)
  end
end