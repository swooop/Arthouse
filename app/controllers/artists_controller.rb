class ArtistsController < ApplicationController
  def index
    @users = User.includes(:galleries).all
  end
end
