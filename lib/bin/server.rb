require 'sinatra'
require 'json'
require 'httparty'

set :port, 9090
set :environment, :production

orders = [
  { unique_id: 66, tablet_id: 'asd-124', title: 'Florentine benedictine', cost: 10 },
  { unique_id: 67, tablet_id: 'asd-134', title: 'Florentine benedictine with extra bacon', cost: 11 },
  { unique_id: 68, tablet_id: 'asd-134', title: 'Double eggs early special', cost: 6 }
];
# Should allow to subscribe to an eable-core instance
def subscribe
  
end

def display(orders)
  system "clear"
  puts orders
end

# We pretend we are subscribed by default
get '/notify' do
  response = HTTParty.get('http://127.0.0.1:8080/orders')
  orders = JSON.parse(response.body)
  display(orders)
end

get '/orders' do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*'

  return orders.to_json
end
