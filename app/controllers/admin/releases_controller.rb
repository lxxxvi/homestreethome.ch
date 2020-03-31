class Admin::ReleasesController < ApplicationController
  before_action :set_release, only: [:show, :edit, :update, :destroy]

  def index
    @releases = Release.all
  end

  def show
  end

  def new
    @release = Release.new
  end

  def edit
  end

  def create
    @release = Release.new(release_params)

    if @release.save
      redirect_to [:admin, @release], notice: 'Release was successfully created.'
    else
      render :new
    end
  end

  def update
    if @release.update(release_params)
      redirect_to [:admin, @release], notice: 'Release was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @release.destroy
    redirect_to admin_releases_url, notice: 'Release was successfully destroyed.'
  end

  private

  def set_release
    @release = Release.find(params[:id])
  end

  def release_params
    params.require(:release).permit(:catalog_number, :artist, :name, :released_on, :playlist, :credits, :download_url,
                                    :discogs_url, :published_at)
  end
end
