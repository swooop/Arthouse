class GalleriesController < ApplicationController

  before_filter :gallery_belongs_to_user, :only => [:edit, :update, :destroy]

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.includes(:user).find(params[:id])
  end
  
  def edit
  end

  def update
    if @gallery.update_attributes(params[:gallery])
      redirect_to gallery_path(@gallery), flash: { notice: 'Updated!' }
    else
      render 'edit', flash: { errors: @gallery.errors }
    end
  end

  def new
    @gallery = Gallery.new(images: [Image.new])
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    @gallery.user = current_user
    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      render 'new', flash: { errors: @gallery.errors }
    end
  end

  def destroy
    if gallery.delete
      redirect_to galleries_path, notice: "Deleted #{gallery.title}"
    else
      redirect_to gallery_path(@gallery), flash: { errors: gallery.errors }
    end
  end

  def like
    @gallery = Gallery.find(params[:id])
    @gallery.like_count += 1
    if @gallery.save
      render :json => { success: true, like_count: @gallery.like_count }
    else
      render :json => { success: false }
    end
  end

  private

  def gallery_belongs_to_user
    @gallery = Gallery.find(params[:id])
    if current_user != @gallery.user       
      redirect_to root_url, :notice => "Gallery does not belong to you."
    end
  end

end
