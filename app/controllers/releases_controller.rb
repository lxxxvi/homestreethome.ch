class ReleasesController < ApplicationController
  before_action :set_release, only: %i[edit update destroy]

  def index
    @releases = Release.active.ordered_antichronological
  end

  def edit
    @form = ReleaseForm.new(@release)
  end

  def update
    @form = ReleaseForm.new(@release, release_params)

    if @form.save
      redirect_to edit_release_path(@form.object), notice: 'Release was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @release.archive!
    redirect_to releases_url, notice: 'Release was successfully archived.'
  end

  private

  def set_release
    @release = Release.find_by!(catalog_number: params[:catalog_number])
  end

  def release_params
    params.require(:release).permit(:bandcamp_url, :published)
  end
end
