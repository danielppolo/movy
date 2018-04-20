class BookingsController < ApplicationController
	  skip_before_action :authenticate_user!, only: [ :new ]

    before_action :set_booking, only: [:show, :edit, :update, :destroy, :decline, :approve]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
    @bike = Bike.find(params[:bike_id])
    @marker = [{ lat: @bike.latitude, lng: @bike.longitude }]
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bike = Bike.find(params[:bike_id])
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created!' #BANANA
    else
      render :new
    end
  end

  def show
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated!'
    else
      render :new
    end
  end

  def destroy
    authorize @booking
    @bike = @booking.bike
    @booking.destroy
    redirect_to @bike, notice: 'Booking was successfully canceled!.'
  end

  def approve
    authorize @booking
    @booking.accepted!
    redirect_to profile_path(current_user.profile), notice: 'Booking was accepted!.'
  end

  def decline
    authorize @booking
    @booking.rejected!
    redirect_to profile_path(current_user.profile), notice: 'Booking was declined!.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id)
  end
end
