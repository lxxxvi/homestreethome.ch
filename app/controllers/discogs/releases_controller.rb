class Discogs::ReleasesController < ApplicationController
  def new
    @form = Discogs::ReleaseForm.new(Release.new)
  end

  def create
    @form = Discogs::ReleaseForm.new(Release.new, discogs_release_params)

    if @form.save
      redirect_to edit_release_path(@form.object), notice: 'Release was successfully created.'
    else
      render :new
    end
  end

  private

  def discogs_release_params
    params.require(:discogs_release).permit(:discogs_release_id, :manual_discogs_release_id)
  end
end
