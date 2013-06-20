class TypeconnectsController < ApplicationController
  # GET /typeconnects
  # GET /typeconnects.json
  def index
    @typeconnects = Typeconnect.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @typeconnects }
    end
  end

  # GET /typeconnects/1
  # GET /typeconnects/1.json
  def show
    @typeconnect = Typeconnect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @typeconnect }
    end
  end

  # GET /typeconnects/new
  # GET /typeconnects/new.json
  def new
    @typeconnect = Typeconnect.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @typeconnect }
    end
  end

  # GET /typeconnects/1/edit
  def edit
    @typeconnect = Typeconnect.find(params[:id])
  end

  # POST /typeconnects
  # POST /typeconnects.json
  def create
    @typeconnect = Typeconnect.new(params[:typeconnect])

    respond_to do |format|
      if @typeconnect.save
        format.html { redirect_to @typeconnect, notice: 'Typeconnect was successfully created.' }
        format.json { render json: @typeconnect, status: :created, location: @typeconnect }
      else
        format.html { render action: "new" }
        format.json { render json: @typeconnect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /typeconnects/1
  # PUT /typeconnects/1.json
  def update
    @typeconnect = Typeconnect.find(params[:id])

    respond_to do |format|
      if @typeconnect.update_attributes(params[:typeconnect])
        format.html { redirect_to @typeconnect, notice: 'Typeconnect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @typeconnect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /typeconnects/1
  # DELETE /typeconnects/1.json
  def destroy
    @typeconnect = Typeconnect.find(params[:id])
    @typeconnect.destroy

    respond_to do |format|
      format.html { redirect_to typeconnects_url }
      format.json { head :no_content }
    end
  end
end
