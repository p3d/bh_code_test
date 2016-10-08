class Checkout
  attr_reader :basket

  def initialize(promotional_rules)
    @basket = []
    @basket_total = 0
    @promotional_rules = promotional_rules
  end

  def scan(item)
    @basket << item
  end

  def total
    apply_promotions
    calculate_total
    @basket_total
  end

  private
  def calculate_total
    @basket_total  = @basket.reduce(0) { |sum, item| sum+item.price }
  end

  def apply_promotions
    @promotional_rules.each do |promo|
      promo.apply(self)
    end
  end

end
