class LoggedMail < ActiveRecord::Base
  attr_accessible :body, :from, :html, :subject, :to, :reply_to

  serialize :from
  serialize :reply_to
  serialize :to
  serialize :body
  serialize :html

  def has_text?
    self.body.present?
  end

  def has_html?
    self.html.present?
  end

  def self.delivering_email(message)
  	::LoggedMail.create(
			:to => message.to,
			:from => message.from,
			:subject => message.subject,
			:body => message.text_part,
			:html => message.html_part
  	)
  end
end
