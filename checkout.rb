class Checkout
  attr_reader :basket

  def initialize(promotional_rules)
    @basket = []
  end

  def scan(item)
    @basket << item
  end

  def total
    @basket.reduce(0) { |sum, item| sum+item.price }
  end
end
