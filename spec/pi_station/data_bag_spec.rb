require 'spec_helper'
require 'timecop'
require 'pi_station/data_bag'

RSpec.describe PiStation::DataBag do
  let(:instance) { described_class.new location: 'wohnzimmer', temperature: 22 }

  describe '.new' do
    it 'initializes the attributes' do
      expect(instance.timestamp).to be_a Time
      expect(instance.location).to eq 'wohnzimmer'
      expect(instance.temperature).to eq 22.0
    end
  end

  describe '#to_json' do
    it 'renders a valid json string' do
      Timecop.freeze '2015-12-31 12:00' do
        expect(instance.to_json).
          to eq "{\"timestamp\":1451559600000,\"location\":\"wohnzimmer\",\"value\":22.0}"
      end
    end
  end
end
