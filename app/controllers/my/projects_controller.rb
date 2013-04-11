class My::ProjectsController < ApplicationController

	before_filter :login

  def index
  	# Need to load projects for the current user, not Project.all

  	@projects = current_user.projects

  end

  def new
  	@project = current_user.projects.new
  end

  def create
  	@project = Project.create(params[:project])

  	if @project.save
		redirect_to my_project_path(@project)
	else
		render :new
	end
  end

  def show
  	@project = Project.find params[:id]
  end

  def edit
  end


	private

	def login
		if !current_user
	  		redirect_to new_session_path, :alert => "Please login to access your account!"
	  end
	end
end