class PortaluserassignmentsController < ApplicationController
  # GET /portaluserassignments
  # GET /portaluserassignments.json
  def index
    @user = User.find(params[:user_id])
    #@portaluserassignments = Portaluserassignment.all
    #@portaluserassignmentsage = @user.agencies
    @portaluserassignmentsage = Portaluserassignment.where(:user_id => @user.id)

     @portaluserassignment = Portaluserassignment.new

    end





  # GET /portaluserassignments/1
  # GET /portaluserassignments/1.json
  def show
    @portaluserassignment = Portaluserassignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @portaluserassignment }
    end
  end

  # GET /portaluserassignments/new
  # GET /portaluserassignments/new.json
  def new
    @portaluserassignment = Portaluserassignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portaluserassignment }
    end
  end

  # GET /portaluserassignments/1/edit
  def edit
    @portaluserassignment = Portaluserassignment.find(params[:id])
  end

  # POST /portaluserassignments
  # POST /portaluserassignments.json
  def create
     @user = User.find(params[:user_id])
     @agency = Agency.find(params[:portaluserassignment][:agency_id])
     @p = Portaluserassignment.new
     @p.agency_id = @agency.id
     @p.user_id = @user.id
     #redirect_to root_url , notice: p


     #@user.join(@agency)
     #@portaluserassignment = Portaluserassignment.create(agency_id: @agency.id, user_id: @user.id)
     #age = params[:agency_id]
    #@portaluserassignment = Portaluserassignment.new(params[:portaluserassignment])

    #@portaluserassignment = @user.agencies.create(:agency_id => @agency)
    #@project = @agency.projects.build(params[:project])
  
      #@user.agencies.create!

    # redirect_to root_url , notice: params[:portaluserassignment][:agency_id]

      if @p.save
      redirect_to user_portaluserassignments_path(@user)  , notice: 'Portaluserassignment was successfully created.' 
        
      else
    render action: "new" 
       
  end
end

  # PUT /portaluserassignments/1
  # PUT /portaluserassignments/1.json
  def update
    @portaluserassignment = Portaluserassignment.find(params[:id])

    respond_to do |format|
      if @portaluserassignment.update_attributes(params[:portaluserassignment])
        format.html { redirect_to @portaluserassignment, notice: 'Portaluserassignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @portaluserassignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portaluserassignments/1
  # DELETE /portaluserassignments/1.json
  def destroy
    @portaluserassignment = Portaluserassignment.find(params[:id])
    @portaluserassignment.destroy
    @user = User.find(params[:user_id])

redirect_to user_portaluserassignments_path(@user), notice: 'Portaluserassignment was successfully deleted.'

  end
end
