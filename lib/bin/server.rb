require 'sinatra'
require 'json'
require 'httparty'

set :port, 9090
set :environment, :production

# Should allow to subscribe to an eable-core instance
def subscribe
  
end

def display(orders)
  system "clear"
  puts orders
end

# We pretend we are subscribed by default
get '/notify' do
  # TODO Call core
  response = HTTParty.get('http://127.0.0.1:8080/orders')
  orders = JSON.parse(response.body)
  display(orders)
end
