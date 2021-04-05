class UserMailer < ApplicationMailer
  default from: 'row.by'

  def welcome_email
    @data_email = params[:data_email]
    mail(to: 'rcop_grebn_v@tut.by', subject: 'Email created')
  end
end
