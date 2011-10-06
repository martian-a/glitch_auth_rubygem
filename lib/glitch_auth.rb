# This class builds a url that can be used to authenticate
# with the API for Glitch, the game (http://www.glitch.com).
class GlitchAuth

	# Default constructor.
	#
	# @param [String] token the API token associated with the client's API key
	# @param [String] redirect_uri the callback URL associated with the client's API key	
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


	# @param [String] value a string specifying the token already associated with this client's API key.
	def token(value)
		@token = value
	end
	
	# @param [String] value a string specifying the redirect_uri already associated with this client's API key.
	def redirect_uri(value)
		@redirect_uri = value
	end

	# @param [String] value a string specifying the response_type required.  Must be either 'code' or 'token'.
	def response_type(value)
		if (value == 'code' || value == 'token') 								
			@response_type = value
		else
			raise ArgumentError, 'Invalid response type.'
		end	
	end
	
	# @param [String] value a string specifying the scope of the request. Must be either 'identity', 'read' or 'write'.
	def scope(value)	
		if (value == 'identity' || value == 'read' || value == 'write') 								
			@scope = value
		else
			raise ArgumentError, 'Invalid scope.'
		end
	end		
	
	# @param [String] value a string specifying the state.	
	def state(value)
		@state = value
	end

	# @return [String] a URI for authenticating with Glitch, customised as per the settings specified
	def uri
		"#{@path}?response_type=#{@response_type}&client_id=#{@token}&redirect_uri=#{@redirect_uri}&scope=#{@scope}&state=#{@state}"		
	end		

end