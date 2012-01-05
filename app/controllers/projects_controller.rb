# Handles projects maintenace
class ProjectsController < ApplicationController
  before_filter :require_user
  before_filter :work_with_users_project_before, :except => [:index, :new, :create]

  def work_with_users_project_before
    @project = Project.find params[:id],
                            :conditions => ["user_id = ?", current_user],
                            :include => {:activities => :datetimes},
                            :order => "projects.name ASC"
  end

  # Serves listing of existing projects
  def index
    @projects = Project.all_owned_by current_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # Serves details about particular project
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # Serves creation of new project
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # Serves editation of particular project
  def edit
  end

  # Handles creation of project
  def create
    @project = Project.new(params[:project])
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Handles modification of project
  def update
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Handles destroing of project
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end
