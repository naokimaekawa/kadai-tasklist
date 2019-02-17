class TasksController < ApplicationController
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]
    
  def index
    @tasks = Task.all
  end
    
  def show
    #@task = Task.find(params[:id])
    #set_task
  end
    
  def new
    @task = Task.new
  end
    
  def create

    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Task が正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が登録されませんでした'
      render :new
    end
  end
    
  def edit
    #@task = Task.find(params[:id])
    #set_task
  end
  
  def update
    #@task = Task.find(params[:id])
    #set_task
    
    if @task.update(task_params)
      flash[:success] = 'Task が正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が登録されませんでした'
      render :new
    end    
  end
    
  def destroy
    #@task = Task.find(params[:id])
    #set_task
    @task.destroy
    
    flash[:success] = 'Task が正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end
