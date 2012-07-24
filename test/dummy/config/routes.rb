Rails.application.routes.draw do

  mount MailDump::Engine => "/mail_dump"
end
