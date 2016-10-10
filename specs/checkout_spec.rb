require 'minitest/autorun'
require_relative 'setup'

describe Checkout do

  describe "initialisation" do

    it 'has no items when it is created' do
      co = Checkout.new([])
      co.basket.must_equal []
    end

  end

  describe "#scan(product)" do

    it 'adds a product to the checkout' do
      co = Checkout.new([])
      product = Product.new(code: '001', name: 'Test', price: 1)

      co.scan(product)
      co.basket.must_equal [product]
    end

    describe "when there is already a product in the checkout" do
      let(:co) { Checkout.new([]) }
      let(:product1) { Product.new(code: '001', name: 'Test', price: 1) }
      before do
        co.scan(product1)
      end

      it 'appends the new product to the contents' do
        product2 = Product.new(code: '002', name: 'Test2', price: 2)
        co.scan(product2)
        co.basket.must_equal [product1, product2]
      end
    end

  end

  describe "#total" do
    let(:co) { Checkout.new([]) }
    let(:product1) { Product.new(code: '001', name: 'Test', price: 1) }
    let(:product2) { Product.new(code: '002', name: 'Test2', price: 2) }

    describe "when there are no products in the basket" do

      it "returns 0" do
        co.total.must_equal 0
      end

    end

    describe "when there are products in the basket" do

      it "returns the sum of the prices" do
        co.scan(product1)
        co.scan(product2)
        co.total.must_equal product1.price + product2.price
      end

    end

  end

end
