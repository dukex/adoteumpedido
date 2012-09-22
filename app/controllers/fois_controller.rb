class FoisController < ApplicationController
  respond_to :json, :html

  def index
    @fois = Foi.all
    respond_with @fois
  end

  def show
    @foi = Foi.find(params[:id])

    respond_with @foi
  end

  def new
    @foi = Foi.new

    respond_with @foi
  end

  def create
    @foi = Foi.new(params[:foi])


    respond_to do |format|
      if @foi.save
        format.html { redirect_to @foi, notice: 'Foi was successfully created.' }
      else
        format.html { redirect_to @foi, notice: 'Foi wasnt created' }
      end
    end
  end
end
