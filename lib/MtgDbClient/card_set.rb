module MtgDbClient
	class CardSet
		attr_accessor :id, :name, :type, :block, :description,
									:common_count, :uncommon_count, :rare_count, :mythic_rare_count, :basic_land_count,
									:total_cards, :release_date, :card_ids

		def initialize(response)
			self.id = response["id"]
			self.name = response["name"]
			self.type = response["type"]
			self.block = response["block"]
			self.description = response["description"]
			self.common_count = response["common"]
			self.uncommon_count = response["uncommon"]
			self.rare_count = response["rare"]
			self.mythic_rare_count = response["mythicRare"]
			self.basic_land_count = response["basicLand"]
			self.total_cards = response["total"]
			if(response["releaseDate"] != nil)
				self.release_date = Date.parse(response["release_date"])
			end
			self.card_ids = response["cardIds"]
		end
	end
end