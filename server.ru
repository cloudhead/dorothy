$:.unshift "../toto/lib"
require 'toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::ShowExceptions
use Rack::CommonLogger

# Run application
run Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  #
  set :time, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
end
