class ListingsController < ApplicationController
  def my_favorites
    @listings = current_user.favorite_listings
  end

  def my_bookings
    @listings = current_user.booked_listings
  end

  def my_listings
    @listings = Listing.where({ :user_id => current_user.id })
  end

  def index
    @listings = Listing.where({ :availability => true})
    # render("listings/index.html.erb")
  end

  def show
    @listing = Listing.find(params[:id])

    # render("listings/show.html.erb")
  end

  def new
    @listing = Listing.new

    # render("listings/new.html.erb")
  end

  def create
    @listing = Listing.new

    @listing.price = params[:price].gsub('$', '')
    @listing.description = params[:description]
    @listing.address = params[:address]
    @listing.user_id = params[:user_id]
    @listing.availability = params[:availability]

    if @listing.save

      if params[:photo1].present?
      @first_photo = Photo.new

      @first_photo.image_url = params[:photo1]
      @first_photo.listing_id = @listing.id

      @first_photo.save
      end

      if params[:photo2].present?
      @second_photo = Photo.new

      @second_photo.image_url = params[:photo2]
      @second_photo.listing_id = @listing.id

      @second_photo.save
      end

      if params[:photo3].present?
      @third_photo = Photo.new

      @third_photo.image_url = params[:photo3]
      @third_photo.listing_id = @listing.id

      @third_photo.save
      end

      redirect_to "/listings", :notice => "Listing created successfully."
      # save_status == true
      # redirect_to("/listings/#{@listing.id}", :notice => "Listing created successfully.")
    else
      render 'new'
      # render("listings/new.html.erb")
    end
  end

  def edit
    @listing = Listing.find(params[:id])

    # render("listings/edit.html.erb")
  end

  def update
    @listing = Listing.find(params[:id])

    @listing.price = params[:price].to_i
    @listing.description = params[:description]
    @listing.address = params[:address]
    @listing.user_id = params[:user_id]
    @listing.availability = params[:availability]

    # save_status = @listing.save

    if @listing.save

      if @first_photo.present?

      @first_photo = Photo.where(:listing_id => @listing.id)

      @first_photo.image_url = params[:photo1]
      @first_photo.listing_id = @listing.id

      @first_photo.save
      end

      if @second_photo.present?

      @second_photo = Photo.where(:listing_id => @listing.id)

      @second_photo.image_url = params[:photo2]
      @second_photo.listing_id = @listing.id

      @second_photo.save
      end

      if @third_photo.present?

      @third_photo = Photo.where(:listing_id => @listing.id)

      @third_photo.image_url = params[:photo3]
      @third_photo.listing_id = @listing.id

      @third_photo.save
      end

      redirect_to "/my_listings", :notice => "Listing updated successfully."
      # save_status == true
      # redirect_to("/listings/#{@listing.id}", :notice => "Listing updated successfully.")
    else
      render 'edit'
      # render("listings/edit.html.erb")
    end
  end

  def destroy
    @listing = Listing.find(params[:id])

    @listing.destroy

    redirect_to "/listings", :notice => "Listing deleted."
    # if URI(request.referer).path == "/listings/#{@listing.id}"
    #   redirect_to("/", :notice => "Listing deleted.")
    # else
      # redirect_to(:back, :notice => "Listing deleted.")
  end
end
