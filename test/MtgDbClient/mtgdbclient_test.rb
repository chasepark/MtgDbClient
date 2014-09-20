require 'helper'

describe MtgDbClient do
	it 'should have a version' do
		MtgDbClient::VERSION.wont_be_nil
	end
end
