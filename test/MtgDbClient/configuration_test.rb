require 'helper'
	describe '.configure' do
    MtgDbClient::Configuration::VALID_CONFIG_KEYS.each do |key|
      it "should set the #{key}" do
        MtgDbClient.configure do |config|
          config.send("#{key}=", key)
          MtgDbClient.send(key).must_equal key
        end
      end
    end
  end