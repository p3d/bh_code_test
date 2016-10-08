require_relative 'setup'

describe Promotion do

  describe "CheckoutTotalPromotion#apply" do

    it 'reduces the checkout total by the specified percentage' do
      Struct.new('FakeCheckout', :total)
      co = Struct::FakeCheckout.new(10)

      promo = CheckoutTotalPromotion.new(threshold: 9, percentage: 10)
      promo.apply(co).total.must_equal 9.0
    end

  end

  describe "ProductPromotion#apply" do
    let(:co) { Checkout.new([]) }
    let(:item) { Item.new(code: '001', name: 'Test', price: 1) }
    before do
      co.scan(item)
    end

    it 'changes the product price in the checkout if there are enough of them' do
      promotion = ProductPromotion.new(product_code: '001', threshold: 1, new_price: 2)
      promotion.apply(co).basket.first.price.must_equal 2
    end

    it 'does not change the price of the item in the checkout if there are not enough of them' do
      promotion = ProductPromotion.new(product_code: '001', threshold: 2, new_price: 2)
      promotion.apply(co).basket.first.price.must_equal 1
    end

  end
end
