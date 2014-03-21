#!/usr/bin/ruby

require 'erb'
require 'sqlite3'
require 'rack'

class BookList
	attr_accessor :bookList

	def initialize(bookList)
		@bookList = bookList
	end

	def render()
		render.result(binding)
	end

	def get_binding()
		binding
	end
end

class BookApp
	def initialize()
    # can set up variables that will be needed later
		@time = Time.now
	end

	def call(env)
    # create request and response objects
		request = Rack::Request.new(env)
		response = Rack::Response.new
		case env["PATH_INFO"]
	when /^\/?$/
		# include the header
		File.open("header.html", "r") { |head| response.write(head.read) }
		#include the text file
		#file = 'books.txt'
		#f = File.open(file, "r")
		#entries = f.readlines.map.with_index{ |line,i| [i+1]+line.split(/, /) }
		#database
		db = SQLite3::Database.new("books.sqlite3.db")
		entries = []
		db.execute("SELECT * FROM Books") do |record|
			entries.push([record[0],record[1],record[2],record[3],record[4],record[5]])
		end
		#sorting functionality
		entries.sort_by!{ |entry| entry[(request.params['sortBook'] || "0").to_i] }
		#create instance
		record = BookList.new(entries)
		#call template
		renderer = ERB.new(File.read("table_template.html.erb"))
		#write table
		response.write(renderer.result(record.get_binding))

		#f.close
		# include the footer
		File.open("footer.html", "r") { |foot| response.write(foot.read) }

      when /.*?\.css/
        # serve up a css file
        # remove leading /
        file = env["PATH_INFO"][1..-1]
        return [200, {"Content-Type" => "text/css"}, [File.open(file, "rb").read]]
      else
        [404, {"Content-Type" => "text/plain"}, ["Error 404!"]]
      end	# end case

      response.finish
    end
end


Signal.trap('INT') {
	Rack::Handler::WEBrick.shutdown
}

Rack::Handler::WEBrick.run BookApp.new, :Port => 8080
