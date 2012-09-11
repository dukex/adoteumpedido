class FoisController < ApplicationController
  # GET /fois
  # GET /fois.json
  def index
    @fois = Foi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fois }
    end
  end

  # GET /fois/1
  # GET /fois/1.json
  def show
    @foi = Foi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foi }
    end
  end

  # GET /fois/new
  # GET /fois/new.json
  def new
    @foi = Foi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foi }
    end
  end

  # GET /fois/1/edit
  def edit
    @foi = Foi.find(params[:id])
  end

  # POST /fois
  # POST /fois.json
  def create
    @foi = Foi.new(params[:foi])

    respond_to do |format|
      if @foi.save
        format.html { redirect_to @foi, notice: 'Foi was successfully created.' }
        format.json { render json: @foi, status: :created, location: @foi }
      else
        format.html { render action: "new" }
        format.json { render json: @foi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fois/1
  # PUT /fois/1.json
  def update
    @foi = Foi.find(params[:id])

    respond_to do |format|
      if @foi.update_attributes(params[:foi])
        format.html { redirect_to @foi, notice: 'Foi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @foi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fois/1
  # DELETE /fois/1.json
  def destroy
    @foi = Foi.find(params[:id])
    @foi.destroy

    respond_to do |format|
      format.html { redirect_to fois_url }
      format.json { head :no_content }
    end
  end
end
