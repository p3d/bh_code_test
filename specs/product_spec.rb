require 'minitest/autorun'
require_relative 'setup'

describe Product do
  describe 'initialisation' do
    let(:product) { Product.new(code: '001', name: 'Test item', price: 1) }

    it 'sets the code correctly' do
      product.code.must_equal '001'
    end

    it 'sets the name correctly' do
      product.name.must_equal 'Test item'
    end

    it 'sets the price correctly' do
      product.price.must_equal 1
    end
  end
end
