class AppusersController < ApplicationController
  # GET /appusers
  # GET /appusers.json
  def index
    @appusers = Appuser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appusers }
    end
  end

  # GET /appusers/1
  # GET /appusers/1.json
  def show
    @appuser = Appuser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appuser }
    end
  end

  # GET /appusers/new
  # GET /appusers/new.json
  def new
    @appuser = Appuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appuser }
    end
  end

  # GET /appusers/1/edit
  def edit
    @appuser = Appuser.find(params[:id])
  end

  # POST /appusers
  # POST /appusers.json
  def create
    @appuser = Appuser.new(params[:appuser])

    respond_to do |format|
      if @appuser.save
        format.html { redirect_to @appuser, notice: 'Appuser was successfully created.' }
        format.json { render json: @appuser, status: :created, location: @appuser }
      else
        format.html { render action: "new" }
        format.json { render json: @appuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appusers/1
  # PUT /appusers/1.json
  def update
    @appuser = Appuser.find(params[:id])

    respond_to do |format|
      if @appuser.update_attributes(params[:appuser])
        format.html { redirect_to @appuser, notice: 'Appuser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appusers/1
  # DELETE /appusers/1.json
  def destroy
    @appuser = Appuser.find(params[:id])
    @appuser.destroy

    respond_to do |format|
      format.html { redirect_to appusers_url }
      format.json { head :no_content }
    end
  end
end
