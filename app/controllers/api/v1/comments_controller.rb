class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user

  # POST /comments
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:post_id])
    @comment.destroy
    response = {
      message: 'comment deleted'
    }
    render json: response
  end

  private
    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.permit(:content)
    end
end
