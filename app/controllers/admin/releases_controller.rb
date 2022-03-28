class Admin::ReleasesController < Admin::BaseController
  before_action :set_release, only: %i[edit update destroy]

  def index
    @releases = Release.active.ordered_antichronological
  end

  def edit
    @form = Admin::ReleaseForm.new(@release)
  end

  def update
    @form = Admin::ReleaseForm.new(@release, admin_release_params)

    if @form.save
      redirect_to edit_admin_release_path(@form.object), notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @release.archive!
    redirect_to admin_releases_url, notice: t('.success')
  end

  private

  def set_release
    @release = Release.find_by!(catalog_number: params[:catalog_number])
  end

  def admin_release_params
    params.require(:admin_release).permit(:bandcamp_url, :published)
  end
end
