class BikesController < ApplicationController

  before_action :set_bikes, only: [:show, :edit, :update, :destroy, :toggle]


  def index
    @bikes = policy_scope(Bike)
    @bikes_co = @bikes.where.not(latitude: nil, longitude: nil) #BANANA WILL CRASH PROBABLY

    @markers = @bikes_co.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
  end

  def show
  end

  def new
    @bike = current_user.bikes.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    # @bike = current_user.bikes.new(bike_params)
    authorize @bike
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def edit
    @bike.user = current_user
    authorize @bike
  end

  def update
    if @bike.update(bike_params)
      redirect_to bike_path(@bike)
    else
      render :edit
    end
  end


  def destroy
    authorize @bike
    @bike.destroy
  end

  def toggle
    authorize @bike
    @bike.available? ? @bike.unavailable! : @bike.available!
    redirect_to bike_path(@bike)
  end

  def set_bikes
    @bike = Bike.find(params[:id])
    authorize @bike
  end


  private

  def bike_params
    params.require(:bike).permit(:make, :model, :description, :year, :category,
     :cc, :rate, :photo, :location, :consumption, :status)
  end


end


