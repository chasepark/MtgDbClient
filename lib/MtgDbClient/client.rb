require "httparty"


module MtgDbClient
	class Client
		include HTTParty
		attr_accessor *Configuration::VALID_CONFIG_KEYS

		def initialize(options={})
			merged_options = MtgDbClient.options.merge(options)

			Configuration::VALID_CONFIG_KEYS.each do |key|
       	send("#{key}=", merged_options[key])
      end
     
      self.class.base_uri 'api.mtgdb.info'
    end

    #Common Functions
    def get_rarity_types
    	self.class.get("/cards/rarity")
    end

    def get_card_types
    	self.class.get("/cards/types")
    end

    def get_card_subtypes
    	self.class.get("/cards/subtypes")
    end

    #Set Functions
    def get_sets
    	self.class.get("/sets/")
    end

    def get_set(set_id)
    	self.class.get("/sets/#{set_id}")
    end

    def get_random_card_in_set(set_id)
    	self.class.get("/sets/#{set_id}/cards/random")
    end

    def get_sets_by_id(set_ids=[])
    	self.class.get("/sets/#{set_ids.join(',').upcase}")
    end

    #Card Functions
    def get_card(multiverse_id)
    	self.class.get("/cards/#{multiverse_id}")
    end

    def get_cards_by_id(multiverse_ids=[])
    	self.class.get("/cards/#{multiverse_ids.join(',')}")
    end

    def get_cards
    	self.class.get("/cards/")
    end

    def get_random_card
    	self.class.get("/cards/random")
    end

    def get_card_by_name(card_name)
    	self.class.get(URI.escape("/cards/#{card_name}"))
    end

    def filter_cards(property, value)
    	self.class.get(URI.escape("/cards/#{property}=#{value}"))
    end

    def get_card_in_set(set_id, collector_number)
    	self.class.get(URI.escape("/sets/#{set_id}/cards/#{collector_number}"))
    end

    def search(text, start=0, limit=0, isComplex=false)
    	if isComplex
    		self.class.get(URI.escape("/search/?q=#{text}&start=#{start}&limit=#{limit}"))
    	else
    		self.class.get(URI.escape("/search/#{text}?start=#{start}&limit=#{limit}"))
    	end
    end
  end
end