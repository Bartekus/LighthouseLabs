# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  'Message List here'
end

get '/messages' do
  erb :'messages/index'
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end
