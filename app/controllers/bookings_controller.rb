class BookingsController < ApplicationController
  def index
    @bookings = Booking.all

    render("bookings/index.html.erb")
  end

  def show
    @booking = Booking.find(params[:id])

    render("bookings/show.html.erb")
  end

  def new
    @booking = Booking.new

    render("bookings/new.html.erb")
  end

  def create
    @booking = Booking.new

    @booking.listing_id = params[:listing_id]
    @booking.user_id = params[:user_id]

    save_status = @booking.save

    if save_status == true
      redirect_to("/bookings/#{@booking.id}", :notice => "Booking created successfully.")
    else
      render("bookings/new.html.erb")
    end
  end

  def edit
    @booking = Booking.find(params[:id])

    render("bookings/edit.html.erb")
  end

  def update
    @booking = Booking.find(params[:id])

    @booking.listing_id = params[:listing_id]
    @booking.user_id = params[:user_id]

    save_status = @booking.save

    if save_status == true
      redirect_to("/bookings/#{@booking.id}", :notice => "Booking updated successfully.")
    else
      render("bookings/edit.html.erb")
    end
  end

  def destroy
    @booking = Booking.find(params[:id])

    @booking.destroy

    if URI(request.referer).path == "/bookings/#{@booking.id}"
      redirect_to("/", :notice => "Booking deleted.")
    else
      redirect_to(:back, :notice => "Booking deleted.")
    end
  end
end
