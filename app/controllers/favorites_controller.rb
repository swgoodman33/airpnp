class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all

    # render("favorites/index.html.erb")
  end

  def show
    @favorite = Favorite.find(params[:id])

    # render("favorites/show.html.erb")
  end

  def new
    @favorite = Favorite.new

    # render("favorites/new.html.erb")
  end

  def create
    @favorite = Favorite.new

    @favorite.listing_id = params[:listing_id]
    @favorite.user_id = params[:user_id]

    # save_status = @favorite.save

    if @favorite.save
      redirect_to :back, :notice => "Favorite created successfully."
      # redirect_to("/favorites/#{@favorite.id}", :notice => "Favorite created successfully.")
    else
      render 'new'
      # render("favorites/new.html.erb")
    end
  end

  def edit
    @favorite = Favorite.find(params[:id])

    # render("favorites/edit.html.erb")
  end

  def update
    @favorite = Favorite.find(params[:id])

    @favorite.listing_id = params[:listing_id]
    @favorite.user_id = params[:user_id]

    # save_status = @favorite.save

    if @favorite.save
      redirect_to "/my_favorites", :notice => "Favorite updated successfully."
      # save_status == true
      # redirect_to("/favorites/#{@favorite.id}", :notice => "Favorite updated successfully.")
    else
      render 'edit'
      # render("favorites/edit.html.erb")
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy

    redirect_to :back, :notice => "Favorite deleted."
    # if URI(request.referer).path == "/favorites/#{@favorite.id}"
    #   redirect_to("/", :notice => "Favorite deleted.")
    # else
    #   redirect_to(:back, :notice => "Favorite deleted.")
    # end
  end
end
