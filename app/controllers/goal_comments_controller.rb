class GoalCommentsController < ApplicationController

  def create
    @goal_comment = GoalComment.new(goal_comment_params)
    @goal = Goal.find_by(:id => params[:goal_comment][:goal_id])
    if @goal_comment.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors5] = @goal.errors.full_messages
      redirect_to goal_url(@goal)
    end
  end

  def goal_comment_params
    params.require(:goal_comment).permit(:goal_id, :body)
  end
end
