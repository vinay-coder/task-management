class DashboardController < ApplicationController
  protect_from_forgery
  skip_before_action :authenticate_user!

  def home
    @tasks = Task.all
  end

  def search

    # binding.pry
    @tasks = Task.with_category(params['category']).where('title LIKE ?', '%'+params['query']+'%')
  end
end
