class SumlimitsController < ApplicationController
  # GET /sumlimits
  # GET /sumlimits.json
  def index
    @sumlimits = Sumlimit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sumlimits }
    end
  end

  # GET /sumlimits/1
  # GET /sumlimits/1.json
  def show
    @sumlimit = Sumlimit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sumlimit }
    end
  end

  # GET /sumlimits/new
  # GET /sumlimits/new.json
  def new
    @sumlimit = Sumlimit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sumlimit }
    end
  end

  # GET /sumlimits/1/edit
  def edit
    @sumlimit = Sumlimit.find(params[:id])
  end

  # POST /sumlimits
  # POST /sumlimits.json
  def create
    @sumlimit = Sumlimit.new(params[:sumlimit])

    respond_to do |format|
      if @sumlimit.save
        format.html { redirect_to @sumlimit, notice: 'Sumlimit was successfully created.' }
        format.json { render json: @sumlimit, status: :created, location: @sumlimit }
      else
        format.html { render action: "new" }
        format.json { render json: @sumlimit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sumlimits/1
  # PUT /sumlimits/1.json
  def update
    @sumlimit = Sumlimit.find(params[:id])

    respond_to do |format|
      if @sumlimit.update_attributes(params[:sumlimit])
        format.html { redirect_to @sumlimit, notice: 'Sumlimit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sumlimit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sumlimits/1
  # DELETE /sumlimits/1.json
  def destroy
    @sumlimit = Sumlimit.find(params[:id])
    @sumlimit.destroy

    respond_to do |format|
      format.html { redirect_to sumlimits_url }
      format.json { head :no_content }
    end
  end
end
