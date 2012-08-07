require 'test_helper'
require 'mail'

class LoggedMailTest < ActiveSupport::TestCase
  def test_has_html_is_false_if_no_html
    m = LoggedMail.new(:html => nil)
    assert ! m.has_html?
  end
  
  def test_has_html_is_true_if_html_body_present
    m = LoggedMail.new(:html => Mail::Part.new(:body => 'hi!'))
    assert m.has_html?
  end

  def test_has_text_is_false_if_no_body
    m = LoggedMail.new(:body => nil)
    assert ! m.has_text?
  end
  
  def test_has_text_is_true_if_body_body_present
    m = LoggedMail.new(:body => Mail::Part.new(:body => 'hi!'))
    assert m.has_text?
  end

  def test_delivering_mail_creates_logged_mail
    m = Mail.new(:to => "foo@foo.com", :from => "bar@bar.com", :subject => "subject")
    result = LoggedMail.delivering_email(m)

    # to/from addresses are actually in an array
    assert_equal ["foo@foo.com"], result.to
    assert_equal ["bar@bar.com"], result.from
    assert_equal "subject", result.subject   
  end

  def test_delivering_mail_adds_body
    body = Mail::Part.new(:body => "hi!")
    m = Mail.new(:to => "foo@foo.com", :from => "bar@bar.com", :subject => "subject")

    m.text_part = Mail::Part.new do
      body 'hi!'
    end
    
    result = LoggedMail.delivering_email(m)
    assert_equal "hi!", result.body.body.to_s
  end

  def test_delivering_mail_adds_html
    body = Mail::Part.new(:body => "hi!")
    m = Mail.new(:to => "foo@foo.com", :from => "bar@bar.com", :subject => "subject")

    m.text_part = Mail::Part.new do
      body 'hi!'
    end
    m.html_part = Mail::Part.new do
      body '<b>hi!</b>'
    end
    
    result = LoggedMail.delivering_email(m)
    assert_equal "<b>hi!</b>", result.html.body.to_s
  end
end
