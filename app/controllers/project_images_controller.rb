class ProjectImagesController < ApplicationController
  # GET /project_images
  # GET /project_images.json
  def index
    @project_images = ProjectImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_images }
    end
  end

  # GET /project_images/1
  # GET /project_images/1.json
  def show
    @project_image = ProjectImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_image }
    end
  end

  # GET /project_images/new
  # GET /project_images/new.json
  def new
    @project_image = ProjectImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_image }
    end
  end

  # GET /project_images/1/edit
  def edit
    @project_image = ProjectImage.find(params[:id])
  end

  # POST /project_images
  # POST /project_images.json
  def create
    @project_image = ProjectImage.new(params[:project_image])

    respond_to do |format|
      if @project_image.save
        format.html { redirect_to @project_image, notice: 'Project image was successfully created.' }
        format.json { render json: @project_image, status: :created, location: @project_image }
      else
        format.html { render action: "new" }
        format.json { render json: @project_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_images/1
  # PUT /project_images/1.json
  def update
    @project_image = ProjectImage.find(params[:id])

    respond_to do |format|
      if @project_image.update_attributes(params[:project_image])
        format.html { redirect_to @project_image, notice: 'Project image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_images/1
  # DELETE /project_images/1.json
  def destroy
    @project_image = ProjectImage.find(params[:id])
    @project_image.destroy

    respond_to do |format|
      format.html { redirect_to project_images_url }
      format.json { head :no_content }
    end
  end
end
