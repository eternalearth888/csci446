#!/usr/bin/ruby

require 'rack'

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
		file = 'books.txt'
		f = File.open(file, "r")
		entries = f.readlines.map.with_index{ |line,i| [i+1]+line.split(/, /) }
		entries.sort_by!{ |entry| entry[(request.params['sortBook'] || "0").to_i] }
		entries.each { |entry|
			response.write("<tr>")
			response.write("<td>")
			response.write(entry.join("</td><td>"))
			response.write("</td>")
			response.write("</tr>")
		}
		response.write("</table>")
		f.close
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
