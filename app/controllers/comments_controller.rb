class CommentsController < ApplicationController
  respond_to :html

  def create
    @comment = Comment.create(params[:comment])
    @comment.update_attribute :request_id, params[:request_id]
    respond_with @comment, location: @comment.request
  end
end