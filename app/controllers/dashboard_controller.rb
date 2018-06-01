class DashboardController < ApplicationController
  protect_from_forgery

  def home
    @tasks = Task.all
  end

  def search
    @tasks = Task.with_category(params[:category]).where('title LIKE ?', '%'+params[:query]+'%')
  end
end
