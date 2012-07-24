# MailDump -- A Really Simple Mail Logger for Rails #

This is a very straightforward engine for logging mails to the
database, and then viewing them later.


## Setup ##

Add something like this to your routes:

```if Rails.env.development?
  mount MailDump::Engine => '/mail_dump'
end
```


Then, add an something along these lines to config/initializers:

```if  Rails.env.development?
  ActionMailer::Base.register_interceptor(MailDump::LoggedMail)
end
```

You're set! Mails are viewable at /mail_dump.

The output is very simple, and largely taken from the 37signals
mail_view project (https://github.com/37signals/mail_view/) -- which
is a great tool for testing, but doesn't quite cut it if you need to
see the actual output of actual mails.





