module MtgDbClient
	class Ruling
		attr_accessor :released_at, :rule

		def initialize(response)
			self.released_at = Date.parse(response["releasedAt"])
			self.rule = response["rule"]
		end
	end
end