class RequestsController < ApplicationController
  respond_to :json, :html

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
    @request = Request.new(params[:request].except(:authority))
    if @request.save
      redirect_to "http://queremossaber.org.br/#{@request.authority.url_name}"
    else
      respond_with @request
    end
  end
end
