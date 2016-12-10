class UserMailer < ApplicationMailer
  default from: "do-not-reply@example.com"

  def contact_email(visitor)
    @visitor = visitor
    mail(to: Rails.application.secrets.owner_email, from: @visitor.email, :subject => "Website Contact")
  end
end
