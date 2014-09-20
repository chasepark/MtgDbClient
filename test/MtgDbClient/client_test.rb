require 'helper'

describe 'client' do
	it 'should be initializable' do
		mtgdb_client = MtgDbClient::Client.new
		mtgdb_client.wont_be_nil
	end

	it 'should have a set of configured default options' do
		mtgdb_client = MtgDbClient::Client.new
	end

	describe '.sets' do
		it 'should return a list of sets' do
			mtgdb_client = MtgDbClient::Client.new
			mtgdb_client.get_sets.wont_be_nil
		end
	end

	describe '.rarity_types' do
		it 'should return a list of rarities' do
			mtgdb_client = MtgDbClient::Client.new
			mtgdb_client.get_rarity_types.wont_be_nil
		end
	end

	describe '.card_types' do
		it 'should return a list of card master types' do
			mtgdb_client = MtgDbClient::Client.new
			mtgdb_client.get_card_types.wont_be_nil
		end
	end

	describe '.card_subtypes' do
		it 'should return a list of card subtypes' do
			mtgdb_client = MtgDbClient::Client.new
			mtgdb_client.get_card_subtypes.wont_be_nil
		end
	end


	describe '.get_card(id)' do
		it 'should return a specific card for a valid id' do
			mtgdb_client = MtgDbClient::Client.new
			card = mtgdb_client.get_card(386676)
			card.wont_be_nil
		end
	end

	describe '.random_card_in_set(set_id)' do
		it 'should retun a random card from a specified set' do
			mtgdb_client = MtgDbClient::Client.new
			card = mtgdb_client.get_random_card_in_set("TMP")
			card.wont_be_nil
		end
	end

	describe '.sets_by_id(set_ids)' do
		it 'should return the details of the specified sets' do
			mtgdb_client = MtgDbClient::Client.new
			sets = mtgdb_client.get_sets_by_id(["tmp", "sth", "exo" ])
			sets.wont_be_nil
		end
	end

	describe '.get_cards_by_id(multiverse_ids)' do
		it 'should get a list of the cards with specified ids' do
			mtgdb_client = MtgDbClient::Client.new
			cards = mtgdb_client.get_cards_by_id([4818,4822,4823,4825,4826,4829])
			cards.wont_be_nil
		end
	end

	describe '.random_card' do
		it 'should return a random card from a random set' do
			mtgdb_client = MtgDbClient::Client.new
			mtgdb_client.get_random_card.wont_be_nil
		end
	end

	describe '.get_card_by_name' do
		it 'should return all copies of a card with the same name' do
			mtgdb_client = MtgDbClient::Client.new
			card = mtgdb_client.get_card_by_name("Echo Chamber")
			card.wont_be_nil
		end
	end

	#commented due to the time it takes to run the test.
	#describe '.get_cards' do
	#	it 'returns all cards' do
	#		mtgdb_client = MtgDbClient::Client.new
	#		cards = mtgdb_client.get_cards
	#		cards.wont_be_nil
	#	end
	#end

	describe '.filter_cards(property, value)' do
		it 'should return a list of cards with the specified property' do
			mtgdb_client = MtgDbClient::Client.new
			mtgdb_client.filter_cards("subtype", "Rat").wont_be_nil
		end
	end

	describe '.get_card_in_set(set_id, collector_number)' do
		it 'should return the specified card in the specified set' do
			mtgdb_client = MtgDbClient::Client.new
			card = mtgdb_client.get_card_in_set("tmp", 1)
			card["name"].must_equal 'Abandon Hope'
		end
	end

	describe '.get_set(set_id)' do
		it 'should return the specified set' do
			mtgdb_client = MtgDbClient::Client.new
			set = mtgdb_client.get_set("tmp")
			set["name"].must_equal "Tempest"
		end
	end

	describe '.search' do
		describe 'complex search' do
			it 'should return all blue cloud creatures with a converted mana cost less than three' do
				mtgdb_client = MtgDbClient::Client.new
				results = mtgdb_client.search("color eq blue and type m 'Creature' and description m 'flying' " +
                "and convertedmanacost lt 3 and name m 'Cloud'", 0, 0, true)
				results.wont_be_nil
			end
		end

		describe 'basic search' do
			it 'should return all cards that contain the word giant' do
				mtgdb_client = MtgDbClient::Client.new
				mtgdb_client.search("giant").wont_be_nil
			end
		end
	end
end