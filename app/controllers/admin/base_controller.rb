class Admin::BaseController < ApplicationController
  before_action :authenticate
  layout 'admin/layouts/application'

  def authenticate
    unless helpers.signed_in?
      flash[:notice] = 'Please login first'
      redirect_to new_admin_sessions_path
    end
  end

  private

  def sign_out
    session[:signed_in] = nil
  end

  def sign_in
    session[:signed_in] = true
  end
end
