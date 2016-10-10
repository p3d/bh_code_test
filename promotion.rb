class Promotion
  RUN_AT = :before

  def apply(checkout)
    checkout
  end

end

class CheckoutTotalPromotion < Promotion
  RUN_AT = :after

  def initialize(threshold: 0, percentage: 0)
    @threshold = threshold
    @percentage = percentage
  end

  def apply(checkout)
    if checkout.basket_total >= @threshold
      checkout.basket_total = checkout.basket_total * ((100 - @percentage).to_f / 100)
    end
    checkout
  end

end

class ProductPromotion < Promotion

  def initialize(product_code: '', threshold: 0, new_price: 0)
    @product_code = product_code
    @threshold = threshold
    @new_price = new_price
  end

  def apply(checkout)
    if checkout.basket.select { |item| item.code == @product_code }.size >= @threshold
      checkout.basket.each do |item|
        item.price = @new_price if item.code == @product_code
      end
    end
    checkout
  end

end
