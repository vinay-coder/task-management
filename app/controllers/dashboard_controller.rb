class DashboardController < ApplicationController
  def home
    @tasks = Task.all
  end
end
