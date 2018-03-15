class Basket
  attr_reader :content

  def initialize
    @content = []
  end

  def check_collection?(product)
    product.rest == 0
  end

  def buy(collection, product)
    return if product.rest == 0
    product.rest -= 1
    collection.delete(product) if check_collection?(product)
    @content << product
  end

  def total_sum
    @content.inject(0) { |sum, product| sum + product.price }
  end

  def get_purchased_products
    content.each {|product| puts product}
  end
end
