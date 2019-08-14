class CommentsController < ApplicationController
  def index
    comments = Comment.all
    render json: {comments: comments}
  end

  def create
    comment = Comment.create(comment_params)
    render json: CommentSerializer.new(comment).to_serialized_json
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :content, :user_id, :movie_id)
  end
end
