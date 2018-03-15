require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/disk'
require_relative 'lib/products_collection'
require_relative 'lib/basket'

collection = ProductsCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)

basket = Basket.new

wish = nil

while wish != 0
  puts "У нас есть: \n"
  collection.print_products
  puts "\nЧто бы Вы хотели купить? (Введите номер продукта. Для выхода введите 0)"
  wish = STDIN.gets.to_i

  until wish.between?(0, collection.to_a.length)
    puts 'У нас нет такого товара, выберите из предложенного списка'
    wish = STDIN.gets.to_i
  end

  if wish != 0
    product = collection.to_a[wish - 1]
    basket.buy(collection.to_a, product)
    basket.check_collection?(product)
    puts "\nВы выбрали:"
    puts "#{product}\n\n"
  elsif wish == 0 && basket.content.empty?
    puts "Вы ничего не купили, ждём Вас в другой раз!"
  else
    puts "Вы купили:"
    basket.get_purchased_products
    puts "\nИтого к оплате: #{basket.total_sum} ₽. Спасибо за покупку!"
  end
end
