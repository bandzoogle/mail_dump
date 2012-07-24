MailDump::Engine.routes.draw do
  root :to => "logged_mail#index"
  resources :logged_mail
end
