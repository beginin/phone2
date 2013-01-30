class UserlogsController < ApplicationController
  # GET /userlogs
  # GET /userlogs.json
  def index
    @userlogs = Userlog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @userlogs }
    end
  end

  # GET /userlogs/1
  # GET /userlogs/1.json
  def show
    @userlog = Userlog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @userlog }
    end
  end

  # GET /userlogs/new
  # GET /userlogs/new.json
  def new
    @userlog = Userlog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @userlog }
    end
  end

  # GET /userlogs/1/edit
  def edit
    @userlog = Userlog.find(params[:id])
  end

  # POST /userlogs
  # POST /userlogs.json
  def create
    @userlog = Userlog.new(params[:userlog])

    respond_to do |format|
      if @userlog.save
        format.html { redirect_to @userlog, notice: 'Userlog was successfully created.' }
        format.json { render json: @userlog, status: :created, location: @userlog }
      else
        format.html { render action: "new" }
        format.json { render json: @userlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /userlogs/1
  # PUT /userlogs/1.json
  def update
    @userlog = Userlog.find(params[:id])

    respond_to do |format|
      if @userlog.update_attributes(params[:userlog])
        format.html { redirect_to @userlog, notice: 'Userlog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @userlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userlogs/1
  # DELETE /userlogs/1.json
  def destroy
    @userlog = Userlog.find(params[:id])
    @userlog.destroy

    respond_to do |format|
      format.html { redirect_to userlogs_url }
      format.json { head :no_content }
    end
  end
end
