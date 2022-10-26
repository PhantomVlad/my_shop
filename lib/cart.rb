class Cart
  attr_reader :all_price, :products

  def initialize
    @products = []
    @all_price = 0
  end

  def add_product(sell_product)
    @products << sell_product
    @all_price += sell_product.price
  end

  def to_s
    @products.map(&:to_s_end).join("\n")
  end
end