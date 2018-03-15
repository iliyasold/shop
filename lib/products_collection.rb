class ProductsCollection

  PRODUCTS_TYPE = {
      movie: {dir: 'movies', class: Movie},
      book: {dir: 'books', class: Book},
      disk: {dir: 'disks', class: Disk}
  }

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCTS_TYPE.each do |type, hash|

      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def print_products
    to_a.each_with_index {|product, i| puts "#{i.next}. #{product}"}
  end

  def sort!(params)
    case params[:by]
      when :title
        @products.sort_by! {|product| product.to_s}
      when :price
        @products.sort_by! {|product| product.price}
      else
        @products.sort_by! {|product| product.rest}
    end

    @products.reverse! if params[:order] == :asc

    self
  end

  def rest_control
    @products.each do |product|
      if product.rest == 0
        @products.delete(product)
      end
    end
  end
end
