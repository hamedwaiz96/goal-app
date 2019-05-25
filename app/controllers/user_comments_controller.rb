class UserCommentsController < ApplicationController

  def create
    @comment = UserComment.new(user_comment_params)
    if @comment.save
      redirect_to user_url(current_user)
    else
      flash.now[:errors4] = @comment.errors.full_messages
      redirect_to user_url(current_user)
    end
  end

  def user_comment_params
    params.require(:user_comment).permit(:author_id, :user_id, :body)
  end
end
