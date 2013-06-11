class SiteController < ApplicationController
  def index
    @user = User.new
    @users = User.all
    @galleries = Gallery.all
  end
    
end
