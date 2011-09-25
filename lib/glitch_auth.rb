class Glitch_Auth

	# Default constructor
	def initialize(token, redirect_uri)
	
		# unique to glitch
		@path = 'https://api.glitch.com/oauth2/authorize'
		
		# unique to client
		@token = token	
		@redirect_uri = redirect_uri
	
		# default option values
		response_type('code')
		scope('identity')
		state('hello-world')
	
	end

	def token(value)
		@token = value
	end
	
	def redirect_uri(value)
		@redirect_uri = value
	end

	def response_type(value)
		if (value == 'code' || value == 'token') 								
			@response_type = value
		else
			raise ArgumentError, 'Invalid response type.'
		end	
	end
	
	def scope(value)	
		if (value == 'identity' || value == 'read' || value == 'write') 								
			@scope = value
		else
			raise ArgumentError, 'Invalid scope.'
		end
	end		
	
	def state(value)
		@state = value
	end

	def uri
		puts "#{@path}?response_type=#{@response_type}&client_id=#{@token}&redirect_uri=#{@redirect_uri}&scope=#{@scope}&state=#{@state}"		
	end		

end