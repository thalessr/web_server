class Request

	def self.read_request_path(lines)               
		if /^[A-Z]+\s+\/(\S++)/ =~ lines[0]       
			request_path = $1    
		else
		    request_path = "index.html"      #setting a default file                
		end                                      
	end

end