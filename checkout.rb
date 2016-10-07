class Checkout
  attr_reader :contents

  def initialize(promotional_rules)
    @contents = []
  end

  def scan(item)
    @contents << item
  end

  def total
    @contents.reduce(0) { |sum, item| sum+item.price }
  end
end
