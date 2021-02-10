# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def order_email
    UserMailer.order_email(Order.last)
  end
end
