class AppusersController < ApplicationController
before_filter :rights

def rights

  if localisto_staff?
  else
  redirect_to root_path, notice: 'Access Denied' 
  end


end
  def index
    @appusers = Appuser.all
  end

  # GET /appusers/1
  # GET /appusers/1.json
  def show
    @appuser = Appuser.find(params[:id])
  end

  # GET /appusers/new
  # GET /appusers/new.json
  def new
    @appuser = Appuser.new
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
      redirect_to @appuser, notice: 'Appuser was successfully created.' 
      else
         render action: "new" 
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
