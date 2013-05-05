class RequestsController < ApplicationController
  respond_to :json, :html
  before_filter :assign_search, only: [:index]
  before_filter :authenticate_user!, except: [:new, :create]

  def index
    @requests = @search.all
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
    @request = Request.create(params[:request].except(:authority))
    respond_with @request
  end

  private
    def assign_search
      if params[:q]
        @search = Request.search params[:q]
      else
        @search = Request
      end
    end
end
