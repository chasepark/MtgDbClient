module MtgDbClient
	module Configuration
		VALID_CONNECTION_KEYS = [:endpoint].freeze
		VALID_OPTION_KEYS = [:format, :low_res_image_path, :high_res_image_path, :use_https].freeze
		VALID_CONFIG_KEYS = VALID_CONNECTION_KEYS + VALID_OPTION_KEYS

		DEFAULT_ENDPOINT = "api.mtgdb.info"
		DEFAULT_FORMAT = :json
		DEFAULT_LOW_RESOLUTION_IMAGE_PATH = "content/card_images"
		DEFAULT_HIGH_RESOLUTION_IMAGE_PATH = "content/hi_res_card_images"
		DEFAULT_USE_HTTPS = false

		attr_accessor *VALID_CONFIG_KEYS

		def self.extended(base)
			base.reset
		end

		def reset
			self.endpoint = DEFAULT_ENDPOINT
			self.format = DEFAULT_FORMAT
			self.low_res_image_path = DEFAULT_LOW_RESOLUTION_IMAGE_PATH
			self.high_res_image_path = DEFAULT_HIGH_RESOLUTION_IMAGE_PATH
			self.use_https = DEFAULT_USE_HTTPS
		end

		def configure
			yield self
		end

		def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end
	end
end



