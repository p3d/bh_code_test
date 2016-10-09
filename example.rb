require_relative 'promotion'
require_relative 'product'
require_relative 'checkout'


item1 = Product.new(code: '001', name: 'Lavender heart', price: 9.25)
item2 = Product.new(code: '002', name: 'Personalised cufflinks', price: 45.00)
item3 = Product.new(code: '003', name: 'Kids T-shirt', price: 19.95)

lavender_hearts_promo = ProductPromotion.new(product_code: '001', threshold: 2, new_price: 8.5)
basket_total_promo = CheckoutTotalPromotion.new(threshold: 60.00, percentage: 10)

puts 'Test Data'

puts '-'*9

puts 'Basket: 001,002,003'
co = Checkout.new([lavender_hearts_promo, basket_total_promo])
co.scan(item1)
co.scan(item2)
co.scan(item3)
puts 'Total price expected: £66.78'
puts "Actual price is £#{co.total}"
puts ''

puts 'Basket: 001,003,001'
co = Checkout.new([lavender_hearts_promo, basket_total_promo])
co.scan(item1)
co.scan(item3)
co.scan(item1)
puts 'Total price expected: £36.95'
puts "Actual price is £#{co.total}"
puts ''

puts 'Basket: 001,002,001,003'
co = Checkout.new([lavender_hearts_promo, basket_total_promo])
co.scan(item1)
co.scan(item2)
co.scan(item1)
co.scan(item3)
puts 'Total price expected: £73.76'
puts "Actual price is £#{co.total}"





