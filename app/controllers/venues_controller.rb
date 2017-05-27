class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
    render layout: false
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venues_url, notice: 'Venue was successfully created.'
    else
      render :new
    end
  end

  def edit
    render layout: false
  end

  def update
    if @venue.update(venue_params)
      redirect_to venues_url, notice: 'Venue was successfully updated.'
    else
      render :edit
    end
  end

  def show
    render layout: false
  end

  def destroy
    @venue.destroy
    redirect_to venues_url, notice: 'Venue was successfully destroyed.'
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :purpose, :grade, :region, :description, :attractions)
    end
end
