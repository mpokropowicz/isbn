require "sinatra"
require "sinatra/reloader" if development?
require_relative "isbn_class.rb"

get "/" do

	@title = "ISBN"
	erb :get_isbn
end

post "/isbn" do

	num = params[:num]
	@ans = is_valid_ISBN?(num) ? "valid" : "not valid" 
	erb :post_isbn
end