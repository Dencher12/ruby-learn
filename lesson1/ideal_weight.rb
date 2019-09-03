puts "Введите ваше имя"
name = gets.chomp
puts "ВВедите ваш рост"
height = gets.chomp.to_i
idealWeight = height - 110

if idealWeight > 0
  puts "#{name}, ваш оптимальный вес - #{idealWeight} кг"
else 
  puts "#{name}, ваш вес уже оптимальный"
end
