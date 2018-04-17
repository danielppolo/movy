class BikesController < ApplicationController

  before_action :set_bikes, only: [:show, :edit, :update, :destroy]


  def index
    @bikes = policy_scope(Bike)
  end

  def show
  end

  def new
    @bike = current_user.bikes.new
    authorize @bike
  end

  def create
    @bike = current_user.bikes.new(bikes_params)
    authorize @bike
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @bike.destroy
    authorize @bike

  end

  def set_bikes
    @bike = Bike.find(params[:id])
    authorize @bike
  end

end