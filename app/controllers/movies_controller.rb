# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    args=params[:sort]
    if args == 'title' then
     @movies = Movie.order('title ASC')
    elsif args == 'rating' then
     @movies = Movie.order('rating ASC')
    elsif args == 'releasedate' then
     @movies = Movie.order('release_date ASC')
    else
     @movies = Movie.all
    end
  end

  def show
    id = params[:id] # retrieve movie ID from URI route

    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
  end

  def new
    @movie = Movie.new
  end

  def create
    if params.key?('cancel')
      flash[:notice] = "You have cancel your request."
      redirect_to movies_path
    else
      @movie = Movie.create!(params[:movie])
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    end
  end
# in movies_controller.rb
 
  def edit
    @movie = Movie.find params[:id]
  end
 
  def update
    if params.key?('cancel')
      flash[:notice] = "You have cancel your request."
      redirect_to movies_path
    else
      @movie = Movie.find params[:id]
      @movie.update_attributes!(params[:movie])
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def login
    true
  end
end
