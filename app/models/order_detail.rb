class OrderDetail < ApplicationRecord
  belongs_to :order, dependent: :destroy
end
