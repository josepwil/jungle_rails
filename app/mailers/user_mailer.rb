class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email
    @user = params[:user]
    @order = params[:order]
    mail(to: @user.email, subject: "Thank you for your order #{@order.id}")
  end
end
