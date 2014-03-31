class Response

	def self.read_file(lines, client)
	    filename = Request::read_request_path(lines)
		unless filename == nil
			response = if File.exists?(filename)
			File.read(filename)
			else
				"404 - File Not Found"
			end
			client.puts(response)
			client.close                                    
		end
	end

end