require_relative 'setup'

describe Promotion do

  describe "CheckoutTotalPromotion#apply" do

    describe 'when the checkout total is above the threshold value' do
      let(:promo) { CheckoutTotalPromotion.new(threshold: 1, percentage: 10) }
      let(:co) { Checkout.new([promo]) }
      let(:product) { Product.new(code: '001', name: 'Test', price: 1) }

      before do
        co.scan(product)
      end
      it 'reduces the checkout total by the specified percentage' do
        co.total.must_equal 0.9
      end
    end

    describe 'when the checkout total is below the threshold value' do
      let(:promo) { CheckoutTotalPromotion.new(threshold: 10, percentage: 10) }
      let(:co) { Checkout.new([promo]) }
      let(:product) { Product.new(code: '001', name: 'Test', price: 1) }

      before do
        co.scan(product)
      end

      it 'does not change the checkout total' do
        co.total.must_equal 1.0
      end
    end


  end

  describe "ProductPromotion#apply" do
    let(:product) { Product.new(code: '001', name: 'Test', price: 1) }

    it 'changes the product price in the checkout if there are enough of them' do
      promotion = ProductPromotion.new(product_code: '001', threshold: 1, new_price: 2)
      co = Checkout.new([promotion])
      co.scan(product)
      co.total

      co.basket.first.price.must_equal 2
    end

    it 'does not change the price of the product in the checkout if there are not enough of them' do
      promotion = ProductPromotion.new(product_code: '001', threshold: 2, new_price: 2)
      co = Checkout.new([promotion])
      co.scan(product)

      co.basket.first.price.must_equal 1
    end

  end
end
