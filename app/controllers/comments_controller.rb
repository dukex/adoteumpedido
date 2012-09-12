class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.update_attribute :foi_id, params[:foi_id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.foi, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @comment.foi, notice: 'Comment wasnt created' }
      end
    end
  end
end
