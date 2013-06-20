class DescriptioncallsController < ApplicationController
  # GET /descriptioncalls
  # GET /descriptioncalls.json
  def index
    @descriptioncalls = Descriptioncall.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @descriptioncalls }
    end
  end

  # GET /descriptioncalls/1
  # GET /descriptioncalls/1.json
  def show
    @descriptioncall = Descriptioncall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @descriptioncall }
    end
  end

  # GET /descriptioncalls/new
  # GET /descriptioncalls/new.json
  def new
    @descriptioncall = Descriptioncall.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @descriptioncall }
    end
  end

  # GET /descriptioncalls/1/edit
  def edit
    @descriptioncall = Descriptioncall.find(params[:id])
  end

  # POST /descriptioncalls
  # POST /descriptioncalls.json
  def create
    @descriptioncall = Descriptioncall.new(params[:descriptioncall])

    respond_to do |format|
      if @descriptioncall.save
        format.html { redirect_to @descriptioncall, notice: 'Descriptioncall was successfully created.' }
        format.json { render json: @descriptioncall, status: :created, location: @descriptioncall }
      else
        format.html { render action: "new" }
        format.json { render json: @descriptioncall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /descriptioncalls/1
  # PUT /descriptioncalls/1.json
  def update
    @descriptioncall = Descriptioncall.find(params[:id])

    respond_to do |format|
      if @descriptioncall.update_attributes(params[:descriptioncall])
        format.html { redirect_to @descriptioncall, notice: 'Descriptioncall was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @descriptioncall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descriptioncalls/1
  # DELETE /descriptioncalls/1.json
  def destroy
    @descriptioncall = Descriptioncall.find(params[:id])
    @descriptioncall.destroy

    respond_to do |format|
      format.html { redirect_to descriptioncalls_url }
      format.json { head :no_content }
    end
  end
end
