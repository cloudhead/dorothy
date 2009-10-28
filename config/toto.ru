require 'lib/toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images'], :root => 'public'
use Rack::ShowExceptions
use Rack::CommonLogger 

# Run application
run Toto::Server.new
