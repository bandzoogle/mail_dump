class MailDump::LoggedMailController < ActionController::Base
  respond_to :text, :html

  def index
    @mails = LoggedMail.order('created_at DESC').page(params[:p]).per(25)
  end

  def show
    @mail = LoggedMail.find(params[:id])
    respond_to do |format|
      format.html
      format.text { render :format => :html}
    end
  end
end
