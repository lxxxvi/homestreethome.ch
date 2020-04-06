class Admin::ReleasesController < Admin::BaseController
  before_action :set_release, only: %i[edit update destroy]

  def index
    @releases = Release.ordered_by_release_date
  end

  def edit
    @form = Admin::ReleaseForm.new(@release)
  end

  def update
    @form = Admin::ReleaseForm.new(@release, admin_release_params)

    if @form.save
      redirect_to edit_admin_release_path(@form.object), notice: 'Release was successfully updated.'
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

  def admin_release_params
    params.require(:admin_release).permit(:download_url, :bandcamp_url, :published)
  end
end
