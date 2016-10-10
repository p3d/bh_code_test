class Checkout
  attr_reader :basket
  attr_accessor :basket_total

  def initialize(promotional_rules)
    @basket = []
    @basket_total = 0
    @promotional_rules = promotional_rules
  end

  def scan(item)
    @basket << item
  end

  def total
    apply_promotions(:before)
    calculate_total
    apply_promotions(:after)
    @basket_total.round(2)
  end

  private

  def calculate_total
    @basket_total = @basket.reduce(0) { |sum, item| sum + item.price }
  end

  def apply_promotions(run_at = :before)
    @promotional_rules.select { |promo| promo.class::RUN_AT == run_at }.map { |promo| promo.apply(self) }
  end

end
