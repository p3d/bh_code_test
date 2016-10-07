require 'minitest/autorun'
require_relative 'setup'

describe Item do
  describe "initialisation" do
    let(:item) { Item.new(code: '001', name: 'Test item', price: 1) }

    it 'sets the code correctly' do
      item.code.must_equal '001'
    end

    it 'sets the name correctly' do
      item.name.must_equal 'Test item'
    end

    it 'sets the price correctly' do
      item.price.must_equal 1
    end
  end
end