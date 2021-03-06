# MtgDbClient

[![Gem Version](https://badge.fury.io/rb/MtgDbClient.svg)](http://badge.fury.io/rb/MtgDbClient)

This is a simple api wrapper gem for the MtgDb Api found at 'http://api.mtgdb.info'. This is a 1:1 representation of the C# wrapper.

####Dependencies
HttParty

## Installation

Add this line to your application's Gemfile:

    gem 'MtgDbClient'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install MtgDbClient

## Usage
To get started using MtgDbClient first setup the client
	
	require "MtgDbClient"
	
	client = MtgDbClient::Client.new

###Configuration
	
	MtgDbClient.configure do|config|
		config.endpoint = 'api.mtgdb.info'
		#default is api.mtgdb.info
	end	


###The following functions are currently supported:

####Get Rarity Types
returns all available rarity types.

	client.get_rarity_types

####Get Card Types
returns all available card types
	
	client.get_card_types

####Get Card Subtypes
returns all unique subtypes available on all cards

	client.get_card_subtypes
	
####Get Sets
returns a list of sets
	
	client.get_sets

####Get Set
returns a set, specified by the three character set identifier

	client.get_set(set_id)

####Get Random Card In Set
returns a random card from a specified set

	client.get_random_card_from_set(set_id)

####Get Cards In Set
returns all cards in specified set

	client.get_cards_in_set(set_id)

####Get Sets By Id
returns a details of the specified sets

	client.get_sets_by_id([set_ids])

####Get Card
returns a card specified by the multiverse(oracle) id

	client.get_card(card_id)

####Get Cards By Id
returns detaisl of specified cards
	
	client.get_cards_by_id([multiverse_ids])

####Get Cards
returns a list of all cards (WARNING: This takes some time to run.)

	client.get_cards

####Get Random Card
returns a completely random card

	client.get_random_card

####Get Card By Name
returns all instances of a card by name

	client.get_card_by_name(card_name)
	
####Filter Cards
returns a list of all cards with the specified filter

	client.filter_cards(property, value)

####Get Card In Set
returns a card in a specified set with the collector number

	client.get_card_in_set(set_id, collector_id)
####Search
gets a list of cards that meet the specified criteria

	client.search(text, start=0, limit=0, isComplex=false)
	
####Set Object
	set.id
	set.name
	set.type
	set.block
	set.description
	set.common_count
	set.uncommon_count
	set.rare_count
	set.mythic_rare_count
	set.basic_land_count
	set.total_cards
	set.release_date
	set.card_ids

####Card Object
	card.id
	card.related_card_id
	card.set_number
	card.name
	card.search_name
	card.description
	card.flavor
	card.colors
	card.mana_cost
	card.converted_mana_cost
	card.card_set_name
	card.type
	card.sub_type
	card.power
	card.toughness
	card.loyalty
	card.rarity
	card.artist
	card.card_set_id
	card.token
	card.promo
	card.rulings #returns [Rulings]
	card.formats #returns [Format]
	card.released_at
	card.image_low #low-res image
	card.image_high #high-res image

####Ruling Object
	ruling.released_at
	ruling.rule

####Format Object
	format.name
	format.legality
	
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


##Legal
MtgApi Notice:

All information provided is copyrighted by Wizards of the Coast. This api and/or web applications on this domain are not in anyway affiliated with Wizards of the Coast.