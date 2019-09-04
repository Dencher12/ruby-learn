products = {}

loop do
  puts 'Название товара'
  product = gets.chomp

  break if product == 'стоп'

  puts 'Цена товара'
  price = gets.chomp.to_f

  puts 'Количество товара'
  amount = gets.chomp.to_i

  products[product] = { price: price, amount: amount }
end

total = 0
products.each do |product, values|
  price = values[:price]
  amount = values[:amount]
  puts "#{product} #{amount}шт. по #{price} руб., итог: #{amount * price} руб."
  total += amount * price
end

puts "ИТОГО: #{total} руб."
