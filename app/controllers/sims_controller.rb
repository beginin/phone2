class SimsController < ApplicationController
  # GET /sims
  # GET /sims.json
  def index
    @sims = Sim.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sims }
    end
  end

  # GET /sims/1
  # GET /sims/1.json
  def show
    @sim = Sim.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sim }
    end
  end

  # GET /sims/new
  # GET /sims/new.json
  def new
    @sim = Sim.new
    @sim.simnumlog.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sim }
    end
  end

  # GET /sims/1/edit
  def edit
    @sim = Sim.find(params[:id])
  end


  def connect
    @sim = Sim.find(params[:id])
    #@simnumlog = @sim.simnumlog.new
    if @sim.isfree? == false
      respond_to do |format|
        format.html { render action: "show" }
        format.json { render json: @sim.errors, status: :unprocessable_entity }
      end
    else
     @simnumlog = @sim.simnumlog.new
    end
  end



  # POST /sims
  # POST /sims.json
  def create
    @sim = Sim.new(params[:sim])

    respond_to do |format|
      if @sim.save
        format.html { redirect_to @sim, notice: 'Sim was successfully created.' }
        format.json { render json: @sim, status: :created, location: @sim }
      else
        format.html { render action: "new" }
        format.json { render json: @sim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sims/1
  # PUT /sims/1.json
  def update
    @sim = Sim.find(params[:id])

    respond_to do |format|
      if @sim.update_attributes(params[:sim])
        format.html { redirect_to @sim, notice: 'Sim was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sims/1
  # DELETE /sims/1.json
  def destroy
    @sim = Sim.find(params[:id])
    @sim.destroy

    respond_to do |format|
      format.html { redirect_to sims_url }
      format.json { head :no_content }
    end
  end
end
