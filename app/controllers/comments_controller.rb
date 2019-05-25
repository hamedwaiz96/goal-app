class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notices] = ['Comment saved!']
    else
      flash[:errors6] = @comment.errors.full_messages
    end
    redirect_back fallback_location: users_url
  end

  def comment_params
    params.require(:comment).permit(:body, :author_id, :commentable_id, :commentable_type)
  end
end
