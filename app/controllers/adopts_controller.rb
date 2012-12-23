class AdoptsController < ApplicationController
  respond_to :json, :html
  before_filter :assign_request

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
    #if @adopt.save
      # redirect_to "http://queremossaber.org.br/pt/new/#{@adopt.request.authority.url_name}?title=#{URI.escape(@adopt.resume)}&default_letter=#{URI.escape(@adopt.description)}"
    #else
    respond_with @request, @adopt
    #end
  end

  private
    def assign_request
      @request = Request.find(params[:request_id])
      params[:adopt][:request_id] = params[:request_id] if params[:adopt]
    end
end
