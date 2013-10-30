enable :sessions

get '/' do
  # Look in app/views/index.erb
  # session[:message] = 'Hello World!'
  erb :index
end

post '/new_user' do
  # Look in app/views/index.erb
  # session[:message] = 'Hello World!'
  erb :welcome
end

get '/login' do
  # Look in app/views/index.erb
  # session[:message] = 'Hello World!'
  erb :welcome
end

# use Rack::Session::Cookie, :key => 'rack.session',
#                            :domain => 'foo.com',
#                            :path => '/',
#                            :expire_after => 2592000, # In seconds
#                            :secret => 'change_me'
