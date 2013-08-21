class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index

  	@tasks = current_user.tasks.order("status DESC")

  	@exist_starting_task = current_user.tasks.find_by_status(1).nil?

  end

  def update

  	task = current_user.tasks.find_by_id( params[:id] )

  	if !task.nil?
  		task.update_status params[:status]
  	end

  	redirect_to :action => :index
  end

end
