class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
    render layout: false
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to routes_url, notice: 'Route was successfully created.'
    else
      render :new
    end
  end

  def edit
    render layout: false
  end

  def update
    if @route.update(route_params)
      redirect_to routes_url, notice: 'Route was successfully updated.'
    else
      render :edit
    end
  end

  def show
    render layout: false
  end

  def destroy
    @route.destroy
    redirect_to routes_url, notice: 'Route was successfully destroyed.'
  end

  private
    def set_route
      @route = Route.find(params[:id])
    end

    def route_params
      params.require(:route).permit(:venue_id, :name, :description, :distance, :modes_of_transport)
    end
end
