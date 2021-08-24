require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id 
      redirect to '/account'
    end 
    erb :error 
  end

  get '/account' do
    #find the current users session - if its correct show the account, else show an error
    #this is also in the helpers.rb
    @current_user = User.find_by_id(session[:user_id])
    if @current_user 
      erb :account 
    else   
      erb :error 
    end 
  end

  get '/logout' do
    #session.clear is the standard
    session.clear
    redirect to '/'

  end


end

