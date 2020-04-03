module Admin::ApplicationHelper
  def signed_in?
    session[:signed_in]
  end
end
