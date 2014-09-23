require "MtgDbClient/version"
require "MtgDbClient/configuration"
require "MtgDbClient/client"
require "MtgDbClient/card_set"
require "MtgDbClient/card"
require "MtgDbClient/ruling"
require "MtgDbClient/format"


module MtgDbClient
	extend Configuration
	
	def new(options={})
		Client.new(options)
	end

  def method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    new.send(method, *args, &block)
  end

  def respond_to?(method, include_private = false)
    new.respond_to?(method, include_private) || super(method, include_private)
  end
end
