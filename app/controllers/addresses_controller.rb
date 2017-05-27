class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
    render layout: false
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_url, notice: 'Address was successfully created.'
    else
      render :new
    end
  end

  def edit
    render layout: false
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_url, notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end

  def show
    render layout: false
  end

  def destroy
    @address.destroy
    redirect_to addresses_url, notice: 'Address was successfully destroyed.'
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:user_id, :purpose, :address_line_1, :address_line_2, :landmark, :city, :state, :country, :pincode)
    end
end
