class Project < ApplicationRecord
  belongs_to :user
  has_many :courses, dependent: :destroy

  def total_sales_update(project, total_sales)
    project.update( total_sales: total_sales )
  end

end
