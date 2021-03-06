class MailDump::LoggedMailController < ActionController::Base
  layout 'mail_dump/application'

  def index
    @mails = LoggedMail.order('created_at DESC').page(params[:p]).per(25)
  end
  
  def show
    @mail = LoggedMail.find(params[:id])
  end
end
