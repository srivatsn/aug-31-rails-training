class MoviesController < ApplicationController
  def show
    if params[:id] == "1" then
      title = "Parasite"
      director = "Bong Joon-ho"    
    else
      title = "Titanic"
      director = "Cameron"          
    end

    render :show, locals: { title: title, director: director}
  end
end
