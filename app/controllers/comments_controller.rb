class CommentsController < ApplicationController
  before_action :set_task

  def create
    @comment = current_user.comments.create(comment_params)
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :task_id)
    end

    def set_task
      @task = Task.find(comment_params[:task_id])
    end
end
