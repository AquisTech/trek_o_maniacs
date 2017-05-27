class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
    render layout: false
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_url, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def edit
    render layout: false
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_url, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def show
    render layout: false
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:resource_type, :resource_id, :purpose, :name, :number)
    end
end
