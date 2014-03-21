#!/usr/bin/ruby

require 'sinatra'
require 'data_mapper'
require_relative 'book'

# install dm-sqlite-adapter
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/books.sqlite3.db")

# Sanitize and Initialize
DataMapper.finalize.auto_upgrade!

# Automatically create tables
#Book.auto_upgrade!

get '/' do
	@title = "Sinatra Search"

	#Grab the books
	@books = Book.all

	#RETURN ME LAST
	erb :no_sort
end

# Sorting
post '/' do
	#Grab the books
	@books = Book.all

	@books.sort!{ |first, second| eval("first.#{params[:sortBook]}") <=> eval("second.#{params[:sortBook]}") }

	#RETURN ME LAST
	erb :sort
end