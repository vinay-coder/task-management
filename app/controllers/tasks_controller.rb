class TasksController < ApplicationController
  before_action :must_authenticate_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
  end

  def my_tasks
    @tasks = current_user.tasks
  end

  def create
    @task = current_user.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to my_tasks_tasks_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id]) rescue unauthenticate_try
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:category, :title, :description, file_paths_attributes: [:id, :name, :_destroy])
    end

    def must_authenticate_user
      redirect_to root_path, notice: 'You must login first to perform this action' unless user_signed_in?
    end

    def unauthenticate_try
      redirect_to my_tasks_tasks_path, notice: 'You can only update tasks added or created by you!'
    end
end
