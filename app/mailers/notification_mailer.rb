class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomsterapp.com"

  def comment_added
    mail(to: "theatrejawa@yahoo.com",
          subject: "A comment was added to your place!")

  end
end
