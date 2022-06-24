class GoalsController < ApplicationController
  def index
    @goals = Goal.order("created_at DESC")
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def goal_params
    params.require(:goal).permit(:title, :purpose, :tag_id)
  end
end
