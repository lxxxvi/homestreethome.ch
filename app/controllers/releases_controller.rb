class ReleasesController < ApplicationController
  def index
    @releases = Release.active.published.ordered_antichronological
  end

  def show
    @release = Release.active.published.find_by!(catalog_number: params[:catalog_number])
  end
end
