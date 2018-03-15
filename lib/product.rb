class Product
  attr_accessor :price, :rest

  def self.from_file
    raise NotImplementedError
  end

  def initialize(params)
    @price = params[:price].to_i
    @rest = params[:rest].to_i
  end

  def update(params)
    @price = params[:price] if params[:price]
    @rest = params[:rest] if params[:rest]
  end

  def to_s
    "#{price} руб. (осталось #{rest})"
  end
end
