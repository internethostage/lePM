class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favourite = Favourite.new
    project   = Project.find params[:project_id]
    favourite.project = project
    favourite.user    = current_user
    if favourite.save
      redirect_to project_path(project), notice: "Added to your favourites"
    else
      redirect_to project_path(project), alert: "Can't add to favourites, already on list?"
    end
  end

  def destroy
    project = Project.find params[:project_id]
    favourite = current_user.favourites.find params[:id]
    favourite.destroy
    redirect_to project_path(project), notice: "Favourite removed!"
  end

end
