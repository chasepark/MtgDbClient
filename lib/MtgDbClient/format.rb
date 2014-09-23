module MtgDbClient
	class Format
		attr_accessor :name, :legality

		def initialize(response)
			self.name = response["name"]
			self.legality = response["legality"]
		end
	end
end