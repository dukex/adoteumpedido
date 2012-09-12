class FoisController < ApplicationController
  def index
    @fois = Foi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fois }
    end
  end

  def show
    @foi = Foi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foi }
    end
  end

  def new
    @foi = Foi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foi }
    end
  end
end
