class Admin::SessionsController < Admin::BaseController
  skip_before_action :authenticate, only: %i[new create destroy]

  def new; end

  def create
    if params[:password] == Rails.configuration.admin_password
      sign_in
      redirect_to admin_releases_path
    else
      flash.now[:alert] = 'Wrong password'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_admin_sessions_path
  end
end
