require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/cart'
require_relative 'lib/product_collection'

currect_path_products = "#{__dir__}/data"
new_collection = ProductCollection.from_dir(currect_path_products)

puts "Здравствуйте, Вас приветствует магазин на диване"
puts

puts "Хотите отсортировать список? Если да, то по какому признаку?(1 - name, 2- author, 3 - amount, 4 - price, 5 - catregories"
input_sort = gets.chop
puts "Если хотите отсортироать от большого к меньшему или Я-А, тогда введите r"
input_reverse = gets.chop
new_collection.sort_collection!(sort_method: input_sort, order: input_reverse)

cart = Cart.new()

loop do
  puts "Что хотите купить?"
  puts
  new_collection.to_a.each.with_index(1) {|product, index| puts "#{index}. #{product}"}
  puts

  puts "Напишите номер покупки. Если хотите завершить покупки - введите end"
  input = gets.chomp
  until input.to_i.between?(1, new_collection.to_a.size)
    if input == "end"
      puts "Список ваших покупок: \n\n#{cart.to_s}"
      puts
      puts "Всего товаров на сумму: #{cart.all_price}. Спасибо за покупку!"
      abort
    end
    puts "Вы ввели неверный номер. Попробуйте еще раз"
    input = gets.chomp
  end

  input_index = input.to_i - 1
  sell_product = new_collection.to_a[input_index]
  puts

  if sell_product.amount?
    puts "Вы выбрали: #{sell_product.to_s_end}"
    cart.add_product(sell_product)
    sell_product.sell!
    puts
  else
    puts "Продукта нет в наличии, нужно выбрать что-то другое"
  end

  puts
  puts "Всего товаров на сумму: #{cart.all_price}"
  puts
end

