class TypecallsController < ApplicationController
  # GET /typecalls
  # GET /typecalls.json
  def index
    @typecalls = Typecall.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @typecalls }
    end
  end

  # GET /typecalls/1
  # GET /typecalls/1.json
  def show
    @typecall = Typecall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @typecall }
    end
  end

  # GET /typecalls/new
  # GET /typecalls/new.json
  def new
    @typecall = Typecall.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @typecall }
    end
  end

  # GET /typecalls/1/edit
  def edit
    @typecall = Typecall.find(params[:id])
  end

  # POST /typecalls
  # POST /typecalls.json
  def create
    @typecall = Typecall.new(params[:typecall])

    respond_to do |format|
      if @typecall.save
        format.html { redirect_to @typecall, notice: 'Typecall was successfully created.' }
        format.json { render json: @typecall, status: :created, location: @typecall }
      else
        format.html { render action: "new" }
        format.json { render json: @typecall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /typecalls/1
  # PUT /typecalls/1.json
  def update
    @typecall = Typecall.find(params[:id])

    respond_to do |format|
      if @typecall.update_attributes(params[:typecall])
        format.html { redirect_to @typecall, notice: 'Typecall was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @typecall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /typecalls/1
  # DELETE /typecalls/1.json
  def destroy
    @typecall = Typecall.find(params[:id])
    @typecall.destroy

    respond_to do |format|
      format.html { redirect_to typecalls_url }
      format.json { head :no_content }
    end
  end
end
