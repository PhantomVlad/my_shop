class Cart
  attr_reader :products

  def initialize
    @products = []
  end

  def total
    @products.sum(&:price)
  end

  def add_product(sell_product)
    @products << sell_product
  end

  def to_s
    products_output = @products.tally
    "#{products_output.map {|product_output, num| "#{product_output.info} - #{num} шт. - всего #{product_output.price*num} рублей"}.join("\n")}"
  end
end