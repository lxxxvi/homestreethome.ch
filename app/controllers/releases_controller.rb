class ReleasesController < ApplicationController
  def index
    @releases = Release.published.ordered_antichronological
  end

  def show
    @release = Release.published.find_by!(catalog_number: params[:catalog_number])
  end
end
