class LoggedMail < ActiveRecord::Base
  attr_accessible :body, :from, :html, :raw, :subject, :to, :reply_to

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


  #
  # implement #delivered_mail observer to log mail after the fact
  #
  def self.delivered_email(message)
    # firgure out if the body is html or text
    if message.multipart?
      html = message.html_part
      text = message.text_part
    else
      if message.content_type =~ /text\/html/
        html = message.body
        text = nil
      else
        text = message.body
        html = nil
      end
    end

    ::LoggedMail.create(
                        :to => message.to,
                        :reply_to => message.reply_to,
                        :from => message.from,
                        :subject => message.subject,
                        :body => text,
                        :html => html,
                        :raw => message.to_s
                        )
  end
end
