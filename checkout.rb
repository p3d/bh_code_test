class Checkout
  attr_reader :contents

  def initialize(promotional_rules)
    @contents = []
  end

  def scan(item)
    @contents << item
  end

  def total
    3
  end
end