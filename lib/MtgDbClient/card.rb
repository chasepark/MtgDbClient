module MtgDbClient
	class Card
		attr_accessor :id, :related_card_id, :set_number, :name, :search_name, :description,
									:flavor, :colors, :mana_cost, :converted_mana_cost, :card_set_name, :type,
									:sub_type, :power, :toughness, :loyalty, :rarity, :artist, :card_set_id, 
									:token, :promo, :rulings, :formats, :released_at

		def initialize(response)
			self.id = response["id"]
			self.related_card_id = response["relatedCardId"]
			self.set_number = response["setNumber"]
			self.name = response["name"]
			self.search_name=response["searchName"]
			self.description=response["description"]
			self.flavor = response["flavor"]
			self.colors = response["colors"]
			self.mana_cost = response["manacost"]
			self.converted_mana_cost = response["convertedManaCost"]
			self.card_set_name = response["cardSetName"]
			self.type = response["type"]
			self.sub_type = response["subType"]
			self.power = response["power"]
			self.toughness = response["toughness"]
			self.loyalty = response["loyalty"]
			self.rarity = response["rarity"]
			self.artist = response["artist"]
			self.card_set_id = response["cardSetId"]
			self.token = response["token"]
			self.promo = response["promo"]
			self.rulings = response["rulings"].map{|r| Ruling.new(r)}
			self.formats = response["formats"].map{|f| Format.new(f)}
			self.released_at = Date.parse(response["releasedAt"])
		end

		def image_low
			sub_path = ['api.mtgdb.info/content/card_images', self.id].join("/")
			get_path + sub_path
		end

		def image_high
			sub_path = ['api.mtgdb.info/content/high_res_card_images', self.id].join("/")
			get_path + sub_path
		end


		private 
		def get_path
			"http://"
		end
	end
end