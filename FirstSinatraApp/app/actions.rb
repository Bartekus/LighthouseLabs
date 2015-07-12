# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

post '/messages' do
  @message = Message.new(
    title: params[:title],
    content: params[:content],
    author:  params[:author]
  )
  @message.save
  redirect '/messages'
end

get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end
