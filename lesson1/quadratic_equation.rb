puts "Введите a:"
a = gets.chomp.to_f

puts "Введите b:"
b = gets.chomp.to_f

puts "Введите c:"
c = gets.chomp.to_f

d = b**2 - 4 * a * c

puts "D = #{d}"

if d > 0
  puts "x1 = #{(-b +  Math.sqrt(d)) / (2 * a)}"
  puts "x2 = #{(-b -  Math.sqrt(d)) / (2 * a)}"
elsif d == 0
  puts "x1 = #{(-b +  Math.sqrt(d)) / (2 * a)}"
elsif d < 0
  puts 'Корней нет'
end
