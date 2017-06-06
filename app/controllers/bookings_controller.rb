class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new

    @booking.listing_id = params[:listing_id]
    @booking.user_id = params[:user_id]

    if @booking.save
      redirect_to :back, :notice => "Booking created successfully."
    else
      render 'new'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    @booking.listing_id = params[:listing_id]
    @booking.user_id = params[:user_id]

    if @booking.save
      redirect_to "/my_bookings", :notice => "Booking updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])

    @booking.destroy

    redirect_to :back, :notice => "Booking deleted."
  end
end
