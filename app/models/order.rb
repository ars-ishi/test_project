class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  accepts_nested_attributes_for :order_details

  scope :project_orders, -> (project_id) { where( project_id: project_id) }

  # def total_sales(orders)
  #   sales = 0
  #   orders.each do |order|
  #     sales += order.total_price.to_i
  #   end
  #   return sales
  # end

  def total_price_calculation(confirm_price, order_count)
    confirm_price * order_count
  end

end
