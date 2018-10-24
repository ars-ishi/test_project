class CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
    @project = Project.find(params[:project_id])
    @addresses = current_user.addresses
  end

end
