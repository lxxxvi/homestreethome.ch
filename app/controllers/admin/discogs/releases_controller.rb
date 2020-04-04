class Admin::Discogs::ReleasesController < Admin::BaseController
  def new
    @form = Admin::Discogs::ReleaseForm.new(Release.new)
  end

  def create
    @form = Admin::Discogs::ReleaseForm.new(Release.new, admin_discogs_release_params)

    if @form.save
      redirect_to admin_release_path(@form.object), notice: 'Release was successfully created.'
    else
      render :new
    end
  end

  private

  def admin_discogs_release_params
    params.require(:admin_discogs_release).permit(:discogs_release_id)
  end
end
