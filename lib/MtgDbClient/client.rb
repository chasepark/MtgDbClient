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
        self.class.get("/sets").map{|s| CardSet.new(s)}
    end

    def get_set(set_id)
    	response = self.class.get(URI.escape("/sets/#{set_id}"))
        CardSet.new(response)
    end

    def get_random_card_in_set(set_id)
    	response = self.class.get(URI.escape("/sets/#{set_id}/cards/random"))
        Card.new(response)
    end

    def get_sets_by_id(set_ids=[])
    	self.class.get(URI.escape("/sets/#{set_ids.join(',').upcase}")).map{|s| CardSet.new(s)}
    end

    def get_cards_in_set(set_id)
        self.class.get(URI.escape("/sets/#{set_id}/cards")).map{|c| Card.new(c)}
    end

    #Card Functions
    def get_card(multiverse_id)
    	response = self.class.get("/cards/#{multiverse_id}")
        Card.new(response)
    end

    def get_cards_by_id(multiverse_ids=[])
    	self.class.get(URI.escape("/cards/#{multiverse_ids.join(',')}")).map{|c| Card.new(c)}
    end

    def get_cards
    	self.class.get("/cards").map{|c| Card.new(c)}
    end

    def get_random_card
    	response = self.class.get("/cards/random")
        Card.new(response)
    end

    def get_card_by_name(card_name)
    	response = self.class.get(URI.escape("/cards/#{card_name}")).map{|c| Card.new(c)}
    end

    def filter_cards(property, value)
    	self.class.get(URI.escape("/cards/?#{property}=#{value}")).map{|c| Card.new(c)}
    end

    def get_card_in_set(set_id, collector_number)
    	response = self.class.get(URI.escape("/sets/#{set_id.upcase}/cards/#{collector_number.to_s}"))
        Card.new(response)
    end

    def search(text, start=0, limit=0, isComplex=false)
    	if isComplex
    		self.class.get(URI.escape("/search/?q=#{text}&start=#{start}&limit=#{limit}")).map{|c| Card.new(c)}
    	else
    		self.class.get(URI.escape("/search/#{text}?start=#{start}&limit=#{limit}")).map{|c| Card.new(c)}
    	end
    end
  end
end