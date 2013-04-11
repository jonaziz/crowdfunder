class My::ProjectsController < ApplicationController
  def index
  	# Need to load projects for the current user, not Project.all

  	@projects = current_user.projects

  end

  def new
  end

  def edit
  end
end
