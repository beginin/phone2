class SimlogsController < ApplicationController
  # GET /simlogs
  # GET /simlogs.json
  def index
    @simlogs = Simlog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @simlogs }
    end
  end

  # GET /simlogs/1
  # GET /simlogs/1.json
  def show
    @simlog = Simlog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @simlog }
    end
  end

  # GET /simlogs/new
  # GET /simlogs/new.json
  def new
    @simlog = Simlog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @simlog }
    end
  end

  # GET /simlogs/1/edit
  def edit
    @simlog = Simlog.find(params[:id])
  end

  # POST /simlogs
  # POST /simlogs.json
  def create
    @simlog = Simlog.new(params[:simlog])

    respond_to do |format|
      if @simlog.save
        format.html { redirect_to @simlog, notice: 'Simlog was successfully created.' }
        format.json { render json: @simlog, status: :created, location: @simlog }
      else
        format.html { render action: "new" }
        format.json { render json: @simlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /simlogs/1
  # PUT /simlogs/1.json
  def update
    @simlog = Simlog.find(params[:id])

    respond_to do |format|
      if @simlog.update_attributes(params[:simlog])
        format.html { redirect_to @simlog, notice: 'Simlog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @simlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simlogs/1
  # DELETE /simlogs/1.json
  def destroy
    @simlog = Simlog.find(params[:id])
    @simlog.destroy

    respond_to do |format|
      format.html { redirect_to simlogs_url }
      format.json { head :no_content }
    end
  end
end
