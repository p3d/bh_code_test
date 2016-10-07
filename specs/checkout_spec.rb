require 'minitest/autorun'
require_relative 'setup'

describe Checkout do

  describe "initialisation" do

    it 'has no items when it is created' do
      co = Checkout.new([])
      co.contents.must_equal []
    end

  end

  describe "#scan(item)" do

    it 'adds an item to the checkout' do
      co = Checkout.new([])
      item = Item.new(code: '001', name: 'Test', price: 1)

      co.scan(item)
      co.contents.must_equal [item]
    end

    describe "when there is already an item in the checkout" do
      let(:co) { Checkout.new([]) }
      let(:item1) { Item.new(code: '001', name: 'Test', price: 1) }
      before do
         co.scan(item1)
      end

      it 'appends the new item to the contents' do
        item2 = Item.new(code: '002', name: 'Test2', price: 2)
        co.scan(item2)
        co.contents.must_equal [item1, item2]
      end
    end

  end

  describe "#total" do
    let(:co) { Checkout.new([]) }
    let(:item1) { Item.new(code: '001', name: 'Test', price: 1) }
    let(:item2) { Item.new(code: '002', name: 'Test2', price: 2) }

    describe "when there are no items in the basket" do

      it "returns 0" do
        co.total.must_equal 0
      end

    end

    describe "when there are items in the basket" do

      it "returns the sum of the prices" do
        co.scan(item1)
        co.scan(item2)
        co.total.must_equal item1.price+item2.price
      end
    end
  end

end
