class AgenciesController < ApplicationController
  # GET /agencies
  # GET /agencies.json
  def index
    @agencies = Agency.order('agency.position ASC')
    @subnav = [["Home", root_path, "btn back"], ["New Agency", new_agency_path], ["Order Agencies", agencies_reorder_path ]]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agencies }
    end
  end

  def sort
@agencies = Agency.all
@agencies.each do |agency|
agency.position = params['agency'].to_s.index(agency.id.to_s).to_i + 1
agency.save
end

render :nothing => true
end


def reorder
    @agencies = Agency.order('agency.position ASC')
    @subnav = [["Home", root_path, "btn back"], ["New Agency", new_agency_path]]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agencies }
    end
end


  # GET /agencies/1
  # GET /agencies/1.json
  def show

    @agency = Agency.find(params[:id])
     @subnav = [["Back", root_path, "btn back"], ["Edit Agency Details", "#myModal", "", "modal"], ["Add Project", new_agency_project_path(@agency.id)]  ]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agency }
    end
  end

  # GET /agencies/new
  # GET /agencies/new.json
  def new
    @agency = Agency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agency }
    end
  end

  # GET /agencies/1/edit
  def edit
    @agency = Agency.find(params[:id])
  end

  # POST /agencies
  # POST /agencies.json
  def create
    @agency = Agency.new(params[:agency])

    respond_to do |format|
      if @agency.save
        format.html { redirect_to @agency, notice: 'Agency was successfully created.' }
        format.json { render json: @agency, status: :created, location: @agency }
      else
        format.html { render action: "new" }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agencies/1
  # PUT /agencies/1.json
  def update
    @agency = Agency.find(params[:id])

    respond_to do |format|
      if @agency.update_attributes(params[:agency])
        format.html { redirect_to @agency, notice: 'Agency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    @agency = Agency.find(params[:id])
    @agency.destroy

    respond_to do |format|
      format.html { redirect_to agencies_url }
      format.json { head :no_content }
    end
  end
end
