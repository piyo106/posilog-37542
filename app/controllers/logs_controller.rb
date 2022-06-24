class LogsController < ApplicationController
  def index
    @goal = Goal.find(params[:goal_id])
  end

  def new
  end

  def create
  end
end
