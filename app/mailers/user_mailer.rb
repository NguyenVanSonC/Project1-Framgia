class UserMailer < ApplicationMailer
  def order_notification user
    @user = user
    mail to: @user.email, subject: t("order_notification")
  end
end
