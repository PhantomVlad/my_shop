require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/cart'
require_relative 'lib/product_collection'

currect_path_products = "#{__dir__}/data"
collection = ProductCollection.from_dir(currect_path_products)


puts "Здравствуйте, Вас приветствует магазин на диване"
puts

puts "Хотите отсортировать список? Если да, то по какому признаку?(1 - name, 2- author, 3 - amount, 4 - price, 5 - categories)"
input_sort = gets.chomp
puts "Если хотите отсортировать от большого к меньшему или Я-А, тогда введите r"
input_reverse = gets.chomp
collection.sort_collection!(sort_method: input_sort, order: input_reverse)

cart = Cart.new

loop do
  collection.remove_out_of_stock!
  puts "Что хотите купить?"
  puts
  puts collection
  puts "0. Выход"
  puts

  puts "Напишите номер покупки. Если хотите завершить покупки - введите 0"
  input = gets.chomp
  break if input == "0"

  unless input.to_i.between?(1, collection.to_a.size)
    puts "Вы ввели неверный номер. Попробуйте еще раз"
    next
  end

  input_index = input.to_i - 1
  sell_product = collection.to_a[input_index]
  puts

  if sell_product.in_stock?
    puts "Вы выбрали: #{sell_product.info}"
    cart.add_product(sell_product)
    sell_product.sell!
    puts
  else
    puts "Продукта нет в наличии, нужно выбрать что-то другое"
  end

  puts
  puts "Всего товаров на сумму: #{cart.total}"
  puts
end
puts
puts "Список ваших покупок:"
puts
puts cart
puts
puts "Всего товаров на сумму: #{cart.total}. Спасибо за покупку!"

