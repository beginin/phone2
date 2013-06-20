class LoadcallsController < ApplicationController
  # GET /loadcalls
  # GET /loadcalls.json
  def index
    @loadcalls = Loadcall.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loadcalls }
    end
  end

  # GET /loadcalls/1
  # GET /loadcalls/1.json
  def show
    @loadcall = Loadcall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loadcall }
    end
  end

  # GET /loadcalls/new
  # GET /loadcalls/new.json
  def new
    @loadcall = Loadcall.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loadcall }
    end
  end

  # GET /loadcalls/1/edit
  def edit
    @loadcall = Loadcall.find(params[:id])
  end

  # POST /loadcalls
  # POST /loadcalls.json
  def create
    @loadcall = Loadcall.new(params[:loadcall])

    respond_to do |format|
      if @loadcall.save
        format.html { redirect_to @loadcall, notice: 'Loadcall was successfully created.' }
        format.json { render json: @loadcall, status: :created, location: @loadcall }
      else
        format.html { render action: "new" }
        format.json { render json: @loadcall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loadcalls/1
  # PUT /loadcalls/1.json
  def update
    @loadcall = Loadcall.find(params[:id])

    respond_to do |format|
      if @loadcall.update_attributes(params[:loadcall])
        format.html { redirect_to @loadcall, notice: 'Loadcall was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @loadcall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loadcalls/1
  # DELETE /loadcalls/1.json
  def destroy
    @loadcall = Loadcall.find(params[:id])
    @loadcall.destroy

    respond_to do |format|
      format.html { redirect_to loadcalls_url }
      format.json { head :no_content }
    end
  end
end
