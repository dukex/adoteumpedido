class CommentsController < ApplicationController
  respond_to :html

  def create
    @request = Request.find(params[:request_id])
    @comment = Comment.new(params[:comment])
    @comment.save
    @comment.update_attribute :request_id, @request.id
    respond_with(@comment) do |format|
      format.html { redirect_to @request }
    end
  end
end