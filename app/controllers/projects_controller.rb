class ProjectsController < ApplicationController
   def index
     @projects = Project.includes(:user).order("created_at ASC")
   end

   def show
     @project = Project.find(params[:id])
     @progress_rate = (( @project.total_sales.to_f ) / ( @project.target_sales.to_f ) * 100).to_i
     @orders = Order.where(project_id: params[:id])
     @supporters = []
     @orders.each do |order|
       @supporters << order[:user_id]
     end
     @supporters = @supporters.uniq.length
     @courses = @project.courses
     # @supporters = Order.where(project_id: params[:id]).select(:user_id).select{ |item| item[:user_id] }.uniq
     # @supporters = Order.where(project_id: params[:id]).select(:project_id).uniq
     @courses = @project.courses
   end

   def new
     @project = Project.courses.new

   end

   def create
   end

   private
   def project_params
     params.require(:project).permit(
      :business_entity,
      :corporate_name,
      :staff_name,
      :position,
      :email,
      :phone_number,
      :postal_code,
      :location,
      :representative,
      :website,
      :category,
      :questionnaire,
      :progress,
      :content
    )

end
