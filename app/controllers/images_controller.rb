class ImagesController < ApplicationController

before_filter :own_agency, :except => [:sort]

def own_agency
  project = Project.find(params[:project_id])
  agency = project.agency_id
  if localisto_staff?
  elsif have_access? (agency)
  else
  redirect_to root_path, notice: 'Access Denied' 
  end
end

  def index

  @project = Project.find(params[:project_id])
   @images = @project.images.order('project_image.position ASC')
  @subnav = [['Back', agency_project_path(@project.agency_id, @project), "btn back"]]

   respond_to do |format|
    format.html # index.html.erb
     format.json { render json: @questions }
    end
  end


def sort

@project = Project.find(params[:project_id])
@images = @project.images.all
@images.each do |image|
image.position = params['image'].to_s.index(image.id.to_s).to_i + 1
image.save
end
render :nothing => true
end


  # GET /images/1
  # GET /images/1.json
  def show
    @project = Project.find(params[:project_id])
    @image = @project.images.find(params[:id])

    @subnav = [['Back', project_images_path(@project), "btn back"], ['Change', edit_project_image_path(@project.id, @image)]]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    #@image = Image.new
    @project = Project.find(params[:project_id])
    @image = @project.images.new

    @subnav = [['Back', agency_project_path(@project.agency_id, @project), "btn back"]]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @image = @project.images.find(params[:id])
   @subnav = [['Back', project_images_path(@project), "btn back"]]
    
    #@image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    #@image = Image.new(params[:image])
    @project = Project.find(params[:project_id])
    @image = @project.images.build(params[:image])



        respond_to do |format|
      if @image.save
     
        format.html { redirect_to agency_project_path(@project.agency_id, @project.id), notice: 'Image was successfully created.' }
        format.json { render json: [@project], status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @project = Project.find(params[:project_id])
    @image = @project.images.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to agency_project_path(@project.agency_id, @project.id), notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    #@image = Image.find(params[:id])
    #@image.destroy
    @project = Project.find(params[:project_id])
    @image = @project.images.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to project_images_path(@project.id) }
      format.json { head :no_content }
    end
  end
end
