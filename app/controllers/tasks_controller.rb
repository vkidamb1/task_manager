require 'pry'
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_task, except: %i[index create new]

  def index
    @tasks = Task.where("user_id= ? or access_control = ?",current_user.id,"public")
  end

  def show; end

  def new
    @task = current_user.tasks.build
  end

  def create
    if params["task"]["name"].blank? || params["task"]["details"].blank?
      redirect_to new_task_path, notice: 'Name or Details cannot be blank'
    else
      current_user.tasks.create!(tasks_params)
      redirect_to tasks_path, notice: 'Task was successfully created'
    end
  rescue StandardError => error
    puts error.inspect
  end

  def edit; end

  def update
    @task.update!(tasks_params)
    redirect_to tasks_path, notice: 'Task was successfully updated'
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed'
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:id, :name, :details, :access_control)
  end
end
