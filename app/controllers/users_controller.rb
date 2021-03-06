class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @userlog = @user.userlog.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @userlog = @user.userlog.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @userlog=@user.userlog.new(params[:userlog])
    @userlog.datestart = Phone2::Application::config.timestart
    @userlog.datestop = Phone2::Application::config.timeinfinity


    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    timenow = Time.now()
    userloglast = @user.userlog.last 
    userloglast.datestop = timenow
    userloglast.save
    userlog = @user.userlog.new
    userlog.datestart=timenow + 1
    userlog.datestop = Phone2::Application::config.timeinfinity
    userlog.update_attributes(params[:userlog]) 
    #timenow = Time.now()
    #userloglast = @user.userlog.last 
    #userloglast.datestop = timenow

    #Phone2::Application::config.timeinfinity


    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end               
  
  def updateproporties
    @user = User.find(params[:id])
    @userlog = @user.userlog.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def getsim
    @user = User.find(params[:id])
    @simlog = @user.simlog.last   
    if @simlog.nil?
      respond_to do |format|
        format.html { redirect_to @user, notice: 'Пользователь не имеет сим карт' }
        format.json { head :no_content }
      end
    else
      @simlog.datestop = Time.zone.now
    end
  end

  def getsimpost
    @user = User.find(params[:id])   
    @simlog = @user.simlog.last
    @simlog.update_attributes(params[:simlog])
    respond_to do |format|
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
      format.json { head :no_content }
    end
  end


  def putsim 
     @user = User.find(params[:id])
     @simlog = @user.simlog.new
     @simlog.datestart = Time.zone.now
  end

  def putsimpost
    @user = User.find(params[:id])
    @simlog = @user.simlog.new
    @simlog.datestop = Phone2::Application::config.timeinfinity
    @simlog.update_attributes(params[:simlog])
    respond_to do |format|
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
      format.json { head :no_content }
    end
  end

  def upload
    
  end

  def uploadcsv
     User.uploadcsv(params[:upload])

     #respond_to do |format|
     # format.html { redirect_to users_url }
     # format.json { head :no_content }
     #end
    
  end

  def application
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
    
  end


end
