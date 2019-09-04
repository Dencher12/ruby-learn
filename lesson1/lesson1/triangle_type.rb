puts "Введите первую сторону треугольника"
first_side = gets.chomp.to_f

puts "Введите вторую сторону треугольника"
second_side = gets.chomp.to_f

puts "Введите третью сторону треугольника"
third_side = gets.chomp.to_f

sides = [first_side, second_side, third_side]
hypotenuse = sides.max
sides.delete(hypotenuse)

if sides.size == 2 && hypotenuse**2 == sides[0]**2 + sides[1]**2
  puts "Да это же прямоугольный треугольник!"
else
  puts "Треугольник не прямоугольный :("
end

if sides[0] == sides[1]
  puts "Треугольник равнобедренный!"
else
  puts "Треугольник не равнобедренный :("
end
