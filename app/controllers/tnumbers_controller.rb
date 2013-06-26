class TnumbersController < ApplicationController
  # GET /tnumbers
  # GET /tnumbers.json
  def index
    @tnumbers = Tnumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tnumbers }
    end
  end

  # GET /tnumbers/1
  # GET /tnumbers/1.json
  def show
    @tnumber = Tnumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tnumber }
    end
  end

  # GET /tnumbers/new
  # GET /tnumbers/new.json
  def new
    @tnumber = Tnumber.new
    @tnumber.datein = Phone2::Application::config.timestart
    @tnumber.dateout = Phone2::Application::config.timeinfinity

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tnumber }
    end
  end

  # GET /tnumbers/1/edit
  def edit
    @tnumber = Tnumber.find(params[:id])
  end

  # POST /tnumbers
  # POST /tnumbers.json
  def create
    @tnumber = Tnumber.new(params[:tnumber])

    respond_to do |format|
      if @tnumber.save
        format.html { redirect_to @tnumber, notice: 'Tnumber was successfully created.' }
        format.json { render json: @tnumber, status: :created, location: @tnumber }
      else
        format.html { render action: "new" }
        format.json { render json: @tnumber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tnumbers/1
  # PUT /tnumbers/1.json
  def update
    @tnumber = Tnumber.find(params[:id])

    respond_to do |format|
      if @tnumber.update_attributes(params[:tnumber])
        format.html { redirect_to @tnumber, notice: 'Tnumber was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tnumber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tnumbers/1
  # DELETE /tnumbers/1.json
  def destroy
    @tnumber = Tnumber.find(params[:id])
    @tnumber.destroy

    respond_to do |format|
      format.html { redirect_to tnumbers_url }
      format.json { head :no_content }
    end
  end

  def upload
    
  end

  def uploadcsv
     Tnumber.uploadcsv(params[:upload])

     respond_to do |format|
      format.html { redirect_to tnumbers_url }
      format.json { head :no_content }
     end
    
  end
end
