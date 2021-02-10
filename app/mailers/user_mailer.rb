class UserMailer < ApplicationMailer

  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "Thank you for your order ##{@order.id}")
  end
end
