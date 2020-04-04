class Admin::BaseController < ApplicationController
  before_action :authenticate
  layout 'admin/layouts/application'

  def authenticate
    return if helpers.signed_in?

    redirect_to new_admin_sessions_path, notice: 'Please login first'
  end

  private

  def sign_out
    session[:signed_in] = nil
  end

  def sign_in
    session[:signed_in] = true
  end
end
