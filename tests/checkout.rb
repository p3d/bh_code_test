require 'minitest/autorun'
require_relative 'setup'

class CheckoutTest < Minitest::Test

  def test_checkout_class_exists
    co = Checkout.new
    assert co != nil
  end

  def test_checkout_scan_exists
    co = Checkout.new
    assert_respond_to(co, :scan)
  end

  def test_total_method_exists
    co = Checkout.new
    assert_respond_to(co, :total)
  end

  def test_total_should_return_something
    co = Checkout.new
    assert co.total != nil
  end

end