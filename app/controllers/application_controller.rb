class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/books" do
    Book.all.to_json
  end

  get "/books/:id" do
    book = Book.find(params[:id])
    book.to_json
  end

  get "/books/reviews/:id" do
    book = Book.find(params[:id])
    book.reviews.to_json
  end

  get "/users" do
    User.all.to_json
  end

  get "/users/:id" do
    user=User.find(params[:id])
    if user.nil?
      response = {response: "user not available"}.to_json
    else
      user.to_json
    end
  end

  get "/users/reviews/:id" do
    user = User.find(params[:id])
    user.reviews.to_json
  end

  post "/users/login" do
    user = User.find_by(username: params[:username], password: params[:password])
    if user.nil?
      response = {response: "user not available"}.to_json
    else
      user.to_json
    end
  end

  post "/users/register" do
    user = User.find_by(email: params[:email])
    if user.nil?
      hash = params.reject { |key, value| value.blank? }
      new_user = User.create(hash)
      # User.create(name: params[:name], email: params[:email], password: params[:password)
      new_user.to_json
    else
      response = {response: "user already exists"}.to_json
    end
  end

end
