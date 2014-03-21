#!/usr/bin/ruby

require 'sinatra'
require 'data_mapper'
require_relative 'book'

# install dm-sqlite-adapter
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/books.sqlite3.db")

# Sanitize and Initialize
DataMapper.finalize

# Automatically create tables
Book.auto_upgrade!

get '/' do
	@title = "Sinatra Search"

	#Grab the books
	@books = Book.all

	#RETURN ME LAST
	erb :layout
end

#SORTING?
#entries.sort_by!{ |entry| entry[(request.params['sortBook'] || "0").to_i] }