require_relative 'setup'

describe Promotion do

  describe "CheckoutTotalPromotion#apply" do
    let(:promo) { CheckoutTotalPromotion.new(threshold: 1, percentage: 10) }
    let(:co) { Checkout.new([promo]) }
    let(:item) { Item.new(code: '001', name: 'Test', price: 1) }

    before do
      co.scan(item)
    end

    it 'reduces the checkout total by the specified percentage' do
      co.total.must_equal 0.9
    end

  end

  describe "ProductPromotion#apply" do
    let(:item) { Item.new(code: '001', name: 'Test', price: 1) }

    it 'changes the product price in the checkout if there are enough of them' do
      promotion = ProductPromotion.new(product_code: '001', threshold: 1, new_price: 2)
      co = Checkout.new([promotion])
      co.scan(item)
      co.total

      co.basket.first.price.must_equal 2
    end

    it 'does not change the price of the item in the checkout if there are not enough of them' do
      promotion = ProductPromotion.new(product_code: '001', threshold: 2, new_price: 2)
      co = Checkout.new([promotion])
      co.scan(item)

      co.basket.first.price.must_equal 1
    end

  end
end
