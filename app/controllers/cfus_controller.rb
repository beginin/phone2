class CfusController < ApplicationController
  # GET /cfus
  # GET /cfus.json
  def index
    @cfus = Cfu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cfus }
    end
  end

  # GET /cfus/1
  # GET /cfus/1.json
  def show
    @cfu = Cfu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cfu }
    end
  end

  # GET /cfus/new
  # GET /cfus/new.json
  def new
    @cfu = Cfu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cfu }
    end
  end

  # GET /cfus/1/edit
  def edit
    @cfu = Cfu.find(params[:id])
  end

  # POST /cfus
  # POST /cfus.json
  def create
    @cfu = Cfu.new(params[:cfu])

    respond_to do |format|
      if @cfu.save
        format.html { redirect_to @cfu, notice: 'Cfu was successfully created.' }
        format.json { render json: @cfu, status: :created, location: @cfu }
      else
        format.html { render action: "new" }
        format.json { render json: @cfu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cfus/1
  # PUT /cfus/1.json
  def update
    @cfu = Cfu.find(params[:id])

    respond_to do |format|
      if @cfu.update_attributes(params[:cfu])
        format.html { redirect_to @cfu, notice: 'Cfu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cfu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cfus/1
  # DELETE /cfus/1.json
  def destroy
    @cfu = Cfu.find(params[:id])
    @cfu.destroy

    respond_to do |format|
      format.html { redirect_to cfus_url }
      format.json { head :no_content }
    end
  end
end
