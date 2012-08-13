module MailDump
  module ApplicationHelper
    def output_html(m)
      m.html.respond_to?(:body) ? m.html.body.to_s : m.html
    end
    def output_text(m)
      m.body.respond_to?(:body) ? m.body.body.to_s : m.body
    end
  end
end
