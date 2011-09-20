require 'sinatra'
require 'pubnub'

PUBLISH = 'pub-4f3e077d-4da1-4467-9556-9c94faef31e6'
SUBSCRIBE = 'sub-de82fb73-cdce-11e0-b051-3165b8125ff8'
SECRET = 'sec-8e1f1594-ceb9-48cf-aa56-78dced69a0c5'
API = Pubnub.new PUBLISH, SUBSCRIBE, SECRET, false

LUNCH = %w{ flanigans grovespot milams publix barracuda scottys }

get '/' do
  haml :index
end

post '/spin' do
  API.publish 'channel'=>'bryce-sergio-roulette', 'message'=>LUNCH[rand LUNCH.length]
  ':)'
end
