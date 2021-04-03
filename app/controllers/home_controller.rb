class HomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to dashboard_index_path
    else
      redirect_to root_url
    end
  end
end
