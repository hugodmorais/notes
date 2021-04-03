class DashboardController < ApplicationController
  def index
    @notes = Note.by_user(current_user)
  end
end
