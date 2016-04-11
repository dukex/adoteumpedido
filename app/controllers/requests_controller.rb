class RequestsController < ApplicationController
  respond_to :json, :html
  # before_filter :assign_search, only: [:index]
  before_filter :authenticate_user!, except: [:new, :create]
  before_filter :assign_authority_id, only: :create

  def index
    @requests = Request.all
    respond_with @requests
  end

  def show
    @request = Request.find(params[:id])
    respond_with @request
  end

  def new
    @request = Request.new
    respond_with @request
  end

  def create
    @request = Request.create! permitted_params
    respond_with @request
  end

  private

  def permitted_params
    params.require(:request).permit :description, :resume, :authority_id
  end

  def assign_authority_id
    @authority = Authority.find(params[:request][:authority_id])
    params[:request][:authority_id] = @authority.id
  end
end
