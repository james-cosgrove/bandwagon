require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require_relative './models/band'
require_relative './models/musician'

enable :sessions

helpers do
  def logged_in?
    !!current_musician
  end

  def current_musician
    Musician.find_by(id: session[:musician_id])
  end
end

# Main page
get '/' do
  erb :index
end

# Displays 'login' page
get '/login' do
  erb :login
end

# Login
post '/login' do
  musician = Musician.find_by(email: params[:email])
  if musician && musician.authenticate(params[:password])
    session[:musician_id] = musician.id
    redirect to "/musician/#{musician.id}"
  else
    erb :login
  end
end

# Logout
delete '/logout' do
  session[:musician_id] = nil
  redirect to '/'
end

# Display signup page
get '/signup' do
  erb :signup
end

# Sign up
post '/signup' do
  @musician = Musician.new(@params)
  binding.pry
  if @musician.save
    redirect to "/musician/#{@musician.id}"
  else
    "There was an error"
  end
end

# Show 'musicians' page
get '/musicians' do
  @musicians = Musician.all
  erb :musicians
end

# Display band registration page
get '/register' do
  erb :registration
end

# Register a band
post '/register' do
  @band = Band.new(@params)
  @band.musician_ids = [session[:musician_id]]
  if @band.save
    redirect to "/bands/#{@band.id}"
  else
    "There was an error"
  end
end

# Show 'bands' page
get '/bands' do
  @bands = Band.all
  erb :bands
end

# Display musician profile
get '/musicians/:id' do
  begin
    @musician = Musician.find_by(id: @params[:id])
    erb :musician
  rescue
    "There was an error"
  end
end

# Display band profile
get '/bands/:id' do
  begin
    @band = Band.find_by(id: @params[:id])
    erb :band
  rescue
    "There was an error"
  end
end

# Display edit band info page
get '/bands/:id/edit' do
  begin
    @band = Band.find_by(id: @params[:id])
    erb :editband
  rescue
    "There was an error"
  end
end

# Display edit musician page
get '/musicians/:id/edit' do
  begin
    @musician = Musician.find_by(id: @params[:id])
    erb :editmusician
  rescue
    "There was an error"
  end
end

# Edit band
post '/bands/:id/edit' do
  @params.delete('splat')
  @params.delete('captures')
  @band = Band.find_by(id: @params[:id])
  @band.update(@params)
  if @band.save
    redirect to "/bands/#{@band.id}"
  else
    "There was an error"
  end
end

# Edit musician
post '/musicians/:id/edit' do
  @params.delete('splat')
  @params.delete('captures')
  @musician = Musician.find_by(id: @params[:id])
  binding.pry
  @musician.update(@params)
  if @musician.save
    redirect to "/musicians/#{@musician.id}"
  else
    "There was an error"
  end
end

# Delete band
post '/bands/:id' do
  begin
    @band = Band.find_by(id: @params[:id])
    @band.destroy
    redirect to('/')
  rescue
    "There was an error"
  end
end

# Delete account
post '/musicians/:id' do
  begin
    @musician = Musician.find_by(id: @params[:id])
    @musician.destroy
    redirect to('/')
  rescue
    "There was an error"
  end
end

# not_found do
#   "That resource was unavailable"
# end
