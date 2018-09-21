require 'pry'
class SubTasksController < ApplicationController
  before_action :find_task
  before_action :find_sub_task, except: %i[create new]

  def create
    @sub_task = @task.sub_tasks.create!(sub_tasks_params)
    respond_to do |format|
      format.html { redirect_to @task }
      format.js
    end
  end

  def destroy
    @sub_task = @task.sub_tasks.find(params[:id])
    if @sub_task.destroy
      flash[:success] = 'Sub Task was deleted.'
    else
      flash[:error] = 'Sub Task could not be deleted.'
    end
    respond_to do |format|
      format.html { redirect_to @task }
      format.js
    end
  end

  def update
    @task.sub_tasks.update!(sub_tasks_params)
    respond_to do |format|
      format.html { redirect_to @task }
      format.js
    end
  end

  def new
    @sub_task = @task.sub_tasks.new
  end

  def edit; end

  private

  def find_task
    @task = Task.find(params[:task_id])
  end

  def find_sub_task
    @sub_task = @task.sub_tasks.find(params[:id])
  end

  def sub_tasks_params
    params[:sub_task].permit(:content)
  end
end
