puts "Введите a:"
a = gets.chomp.to_f

puts "Введите b:"
b = gets.chomp.to_f

puts "Введите c:"
c = gets.chomp.to_f

D = b**2 - 4 * a * c

puts "D = #{D}"
if D>0
  puts "x1 = #{(-b +  Math.sqrt(D)) / (2 * a)}"
  puts "x2 = #{(-b -  Math.sqrt(D)) / (2 * a)}"
elsif D == 0 
  puts "x = #{(-b +  Math.sqrt(D)) / (2 * a)}" 
elsif D < 0
  puts "Корней нет"
end           