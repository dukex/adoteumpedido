class AdoptsController < ApplicationController
  respond_to :json, :html
  before_filter :assign_request, only: [:new, :create]
  before_filter :assign_user, only: [:create]

  def show
    @adopt = Adopt.find(params[:id])
    respond_with @adopt
  end

  def new
    @adopt = Adopt.new description: @request.description, resume: @request.resume
    respond_with @adopt
  end

  def create
    @adopt = Adopt.create params[:adopt]
    respond_with @request, @adopt
  end

  private
    def assign_user
      params[:adopt][:user_id] = current_user.id if current_user && current_user.id
    end

    def assign_request
      @request = Request.find(params[:request_id])
      params[:adopt][:request_id] = params[:request_id] if params[:adopt]
    end
end
