$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mail_dump/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mail_dump"
  s.version     = MailDump::VERSION
  s.authors     = ["Bandzoogle"]
  s.email       = ["colin@bandzoogle.com"]
  s.homepage    = "https://github.com/bandzoogle/mail_dump"
  s.summary     = "Very simple rails engine for logging outgoing mails to the database, and viewing them later"
  s.description = "Very simple rails engine for logging outgoing mails to the database, and viewing them later"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.6"
  s.add_dependency "mail"
  s.add_dependency "kaminari" #, ">= 0.13.0"

  s.add_development_dependency "sqlite3"
end
