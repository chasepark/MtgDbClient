module MtgDbClient
	module Configuration
		VALID_CONNECTION_KEYS = [:endpoint].freeze
		VALID_OPTION_KEYS = [:format].freeze
		VALID_CONFIG_KEYS = VALID_CONNECTION_KEYS + VALID_OPTION_KEYS

		DEFAULT_ENDPOINT = "api.mtgdb.info"
		DEFAULT_FORMAT = :json

		attr_accessor *VALID_CONFIG_KEYS

		def self.extended(base)
			base.reset
		end

		def reset
			self.endpoint = DEFAULT_ENDPOINT
			self.format = DEFAULT_FORMAT
		end

		def configure
			yield self
		end

		def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end
	end
end



