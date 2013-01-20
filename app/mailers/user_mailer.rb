class UserMailer < ActionMailer::Base
  default from: "no-reply@meetflock.com"
  
  def new_fellowship_email(invited_id, inviter_id)
    @inviter = Profile.find(inviter_id)
    @invited = Profile.find(invited_id)
    @url  = "http://www.meetflock.com/login"
    mail(:to => @invited.user.email, :subject => "#{@inviter.name} quiere trabajar contigo en Meetflock.")
  end
end
