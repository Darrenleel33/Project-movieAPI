class ApplicationController < Sinatra::Base
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
    set :allow_origin, "*" 
    set :allow_methods, [:get, :post, :patch, :delete, :options] # allows these HTTP verbs
    set :expose_headers, ['Content-Type']
  end

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  get "/info" do
    title= Movie.pluck(:title)
    release_date= Movie.pluck(:release_date)
    description= Movie.pluck(:description)
    count=Movie.count
    {title:title, release_date:release_date, description:description, total_count:count}.to_json
  end

  get "/movies" do
    Movie.all.to_json
  end

  get "/users" do
    User.all.to_json
  end

  get "/bookings" do
    Booking.all.to_json
  end

  get "/user/11/bookings" do
    user=User.find(params[:id])
    bookings=user.booking_and_movie
    bookings.to_json
    end

end
