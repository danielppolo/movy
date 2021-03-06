class BikesController < ApplicationController
	  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_bikes, only: [:show, :edit, :update, :destroy, :toggle]


  def index
    @mbikes = policy_scope(Bike)


    if params[:query].present?
      sql_query = "make ILIKE :query OR model ILIKE :query"
      @query_bikes = Bike.where(sql_query, query: "%#{params[:query]}%")
      if @query_bikes == []
        @bikes = Bike.all
      else
        @bikes = @query_bikes
      end
    else
      @bikes = Bike.all
    end




    @bikes_co = @mbikes.where.not(latitude: nil, longitude: nil) #BANANA WILL CRASH PROBABLY

    @markers = @bikes_co.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
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
      redirect_to profile_path(@bike.user.profile)
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
    redirect_to profile_path(@bike.user.profile)
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


