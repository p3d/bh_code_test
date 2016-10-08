class Promotion
  def apply(checkout)
    checkout
  end
end


class CheckoutTotalPromotion < Promotion

  def initialize(threshold: 0, percentage: 0)
    @threshold = threshold
    @percentage = percentage
  end

  def apply(checkout)

    if checkout.total > @threshold
      checkout.total = checkout.total*((100-@percentage).to_f/100)
    end
    checkout
  end

end
