class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.includes(:user).find(params[:id])
  end
  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
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
    gallery = Gallery.find(params[:id])

    if gallery.delete
      redirect_to galleries_path, notice: "Deleted #{gallery.title}"
    else
      redirect_to gallery_path(@gallery), flash: { errors: gallery.errors }
    end
  end
end
