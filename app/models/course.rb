class Course < ApplicationRecord
  belongs_to :project

  def stock_calculation(course, stock, order_count)
    new_stock = stock - order_count
    course.update( stock: new_stock )
  end
end
