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
end
