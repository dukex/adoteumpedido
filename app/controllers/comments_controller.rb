class CommentsController < ApplicationController
  respond_to :html
  before_filter :assign_request, only: [:create]

  def create
    @comment = Comment.create(params[:comment])
    respond_with(@comment) do |format|
      format.html { redirect_to @request }
    end
  end

  private
    def assign_request
      @request = Request.find(params[:request_id])
      params[:comment][:request_id] = params[:request_id]
    end
end