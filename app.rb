require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all
  erb :'meetups/index'
end

get '/meetups/:id' do
  @id = params[:id]
  @meetup = Meetup.find(@id)
  @users = []
  @users << Attendee.find_by(meetup_id: @id)
  @names = []
  if @users.nil? == false
    @users.each do |user|
      @names << User.find(user.user_id)
    end
  end
  binding.pry
  erb :'meetups/meetup_page'
end

post '/meetups/:id' do
  Attendee.create(user_id: session[:user_id], meetup_id: params[:id])
  redirect '/meetups'
end

get '/create' do
  erb :'meetups/create'
end

post '/create' do
  Meetup.create(location: params[:location],
  time: params[:time],
  name: params[:name],
  duration: params[:duration],
  date: params[:date],
  description: params[:description])
  redirect '/meetups'
end
