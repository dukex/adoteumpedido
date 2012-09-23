class AdoptsController < ApplicationController
  respond_to :html

  def show
    @adopt = Adopt.find(params[:id])
    respond_with @adopt
  end

  def new
    @request = Request.find(params[:request_id])
    @adopt = Adopt.new description: @request.description, resume: @request.resume
    respond_with @adopt
  end

  def create
    @adopt = Adopt.new(params[:adopt])
    @request = Request.find(params[:request_id])
    @adopt.update_attributes request_id: @request.id, user_id: user_id
    respond_with @request, @adopt
  end

  private
  def user_id
    current_user && current_user.id
  end
end
