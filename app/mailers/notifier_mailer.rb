class NotifierMailer < ApplicationMailer
  default from: 'no-reply@aragon.com',
  return_path: 'michaeluzdavines@gmail.com'

  def welcome(recipient)
    @account = recipient
    mail(to: recipient.email,
         bcc: ["michaeluzdavines@gmail.com"])
  end

  def newtrade(trade)
    @trade = trade
    mail(to: trade.offeree_email, bcc: ["michaeluzdavines@gmail.com"])
  end

end
