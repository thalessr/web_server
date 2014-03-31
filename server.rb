require 'socket' # Require socket from Ruby Standard Library (stdlib)
require './request'
require './response'

class Server
	@host = nil
	@port = nil

	def initialize(port)
		@host = '127.0.0.1'
		@port = port
	end

	def run
		server = TCPServer.open(@host, @port)                 
		puts "Server started on #{@host}:#{@port} ..."
		listener(server)
	end


	def listener(server)
		loop do                                            
			client = server.accept                            
			lines = []
			while (line = client.gets.chomp) && !line.empty?  
				lines << line
			end
		    puts lines 
		    Response::read_file(lines, client)
		end
	end
end

r = Server.new(2000)
r.run



