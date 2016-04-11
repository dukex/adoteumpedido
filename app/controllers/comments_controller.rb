class CommentsController < ApplicationController
  respond_to :html

  before_filter :assign_request, only: [:create]

  def create
    @comment = @request.comments.create permitted_params
    respond_with(@comment) do |format|
      format.html { redirect_to @request }
    end
  end

  private

  def permitted_params
    params.require(:comment).permit :body
  end

  def assign_request
    @request = Request.find(params[:request_id])
  end
end