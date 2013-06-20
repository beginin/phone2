class CalllogsController < ApplicationController
  # GET /calllogs
  # GET /calllogs.json
  def index
    @calllogs = Calllog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calllogs }
    end
  end

  # GET /calllogs/1
  # GET /calllogs/1.json
  def show
    @calllog = Calllog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @calllog }
    end
  end

  # GET /calllogs/new
  # GET /calllogs/new.json
  def new
    @calllog = Calllog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @calllog }
    end
  end

  # GET /calllogs/1/edit
  def edit
    @calllog = Calllog.find(params[:id])
  end

  # POST /calllogs
  # POST /calllogs.json
  def create
    @calllog = Calllog.new(params[:calllog])

    respond_to do |format|
      if @calllog.save
        format.html { redirect_to @calllog, notice: 'Calllog was successfully created.' }
        format.json { render json: @calllog, status: :created, location: @calllog }
      else
        format.html { render action: "new" }
        format.json { render json: @calllog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calllogs/1
  # PUT /calllogs/1.json
  def update
    @calllog = Calllog.find(params[:id])

    respond_to do |format|
      if @calllog.update_attributes(params[:calllog])
        format.html { redirect_to @calllog, notice: 'Calllog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @calllog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calllogs/1
  # DELETE /calllogs/1.json
  def destroy
    @calllog = Calllog.find(params[:id])
    @calllog.destroy

    respond_to do |format|
      format.html { redirect_to calllogs_url }
      format.json { head :no_content }
    end
  end
end
