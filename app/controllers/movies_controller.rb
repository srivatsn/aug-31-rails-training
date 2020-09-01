class MoviesController < ApplicationController
  attr_reader :title, :author

  def show
    if params[:id] == "1" then
      @title = "Parasite"
      @author = "Bong Joon-ho"    
    else
      @title = "Titanic"
      @author = "Cameron"          
    end
  end
end
