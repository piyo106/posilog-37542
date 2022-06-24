class LogsController < ApplicationController
  def index
    @log = Log.new
    @goal = Goal.find(params[:goal_id])
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @log = @goal.logs.new(log_params)
    if @log.save
      redirect_to  goal_logs_path(@goal)
    else
      render :index
    end
  end

  private

  def log_params
    params.require(:log).permit(:content, :category_id)
  end
end
