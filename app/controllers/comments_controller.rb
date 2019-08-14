class CommentsController < ApplicationController
  def index
    comments = Comment.all
    render json: {comments: comments}
  end

  def create
    comment = Comment.create(comment_params)
    render json: CommentSerializer.new(comment).to_serialized_json
  end

  def update
    comment = Comment.find_by(id: params[:id])
    comment.update_attributes(comment_params)
    render json: CommentSerializer.new(comment).to_serialized_json
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    render json: {message: "success"}
  end
  private
  def comment_params
    params.require(:comment).permit(:title, :content, :user_id, :movie_id)
  end
end
