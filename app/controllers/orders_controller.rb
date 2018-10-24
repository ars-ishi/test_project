class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.order_details.build
    @course = Course.find(params[:course_id])
    @project = Project.find(params[:project_id])
    @order_count = params[:order_count].to_i
    @address = Address.find(params[:address_id])
    @total_price = @order.total_price_calculation(@course.price, @order_count)
  end

  def create
    # @project = Project.find(params[:project_id]) #購入されたコースを持つプロジェクト
    @project = Course.find(params[:course_id]).project #購入されたコースを持つプロジェクト
    @target_sales = @project.target_sales #そのプロジェクトの目標金額
    @total_price = order_params[:total_price].to_i #今回追加される金額
    @orders = Order.project_orders(@project.id) #プロジェクトの過去オーダーの配列
    @present_total_sales = @project.total_sales #決済前にプロジェクトに集まっていた金額
    @update_total_sales = @present_total_sales + @total_price #決済後にプロジェクトに集まった金額
    Order.create(order_params) #オーダーを作成する
    @project.total_sales_update(@project, @update_total_sales) #プロジェクトに集まった金額を更新
    course = Course.find(params[:course_id]) #購入されたコース
    order_count = order_params[:order_details_attributes].values[0]['order_count'].to_i #購入された個数
    course.stock_calculation(course, course.stock, order_count) #在庫を更新する
  end


  private

  def order_params
    params.require(:order).permit(
      :total_price,
      :address,
      :payment,
      :project_id,
      order_details_attributes: [:course_id, :order_count, :confirm_price, :confirm_duedate, :confirm_duedate]
    ).merge(user_id: current_user.id)
  end

  # def order_detail_params
  #   params.require(:order).permit(order_details_attributes: [:order_count, :confirm_price, :confirm_duedate, :confirm_duedate])
  # end

end

# create_table :orders do |t|
#   t.references :user, foreign_key: true
#   t.integer :total_price
#   t.string :address
#   t.string :payment
#   t.timestamps
# end
#
# create_table :order_details do |t|
#   t.references :order, foreign_key: true
#   t.references :course, foreign_key: true
#   t.integer :order_count
#   t.integer :confirm_price
#   t.integer :confirm_duedate
#   t.timestamps
# end
