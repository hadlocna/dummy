enable :sessions

get '/' do
  puts session[:id]
  if session[:id]== nil
    erb :index
  else
    erb :welcome
  end
end

post '/new_user' do
  new_user = User.new(first_name: params[:first_name],
                         last_name: params[:last_name],
                         email: params[:email],
                         password: params[:password])
  erb :welcome
end

get '/user_login_page' do

  # p User.find_by_first_name(params[:first_name]).id
  # Look in app/views/index.erb
  # session[:message] = 'Hello World!'
  erb :login
end

get '/user_login' do
  if User.authenticate?(params[:first_name], params[:password])
    session[:id] = User.find_by_first_name(params[:first_name]).id
    erb :welcome
  else
    erb :index
  end
end


get '/user_logout' do
  session.clear
  erb :index
end

# use Rack::Session::Cookie, :key => 'rack.session',
#                            :domain => 'foo.com',
#                            :path => '/',
#                            :expire_after => 2592000, # In seconds
#                            :secret => 'change_me'
