require 'toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

# Run application
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  #
  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
end

run toto

