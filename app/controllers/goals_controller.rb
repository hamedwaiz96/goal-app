class GoalsController < ApplicationController

  def index
    @goals = Goal.all
    render :index
  end

  def show
    @goal = Goal.find(params[:id])
    @user = User.find_by(:id => @goal.user_id)
    render :show
  end

  def new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors2] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end

  def update
    @goal = Goal.update(params[:id], goal_params)
    if @goal
      redirect_to goal_url(@goal)
    else
      flash.now[:errors3] = ["Invalid parameters"]
      render :edit
    end
  end

  def destroy
    Goal.destroy(params[:id])
    redirect_to goals_url
  end

  def goal_params
    params.require(:goal).permit(:details, :content, :user_id, :private, :completed)
  end
end
