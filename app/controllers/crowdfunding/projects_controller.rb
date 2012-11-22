require_dependency "crowdfunding/application_controller"

module Crowdfunding
  class ProjectsController < ApplicationController

    def index
      @projects = Project.current.all
    end

    def show
      @project = Project.find(params[:id])
    end

  end
end
