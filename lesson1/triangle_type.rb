puts "Введите первую сторону треугольника"
firstSide = gets.chomp.to_f

puts "Введите вторую сторону треугольника"
secondSide = gets.chomp.to_f

puts "Введите третью сторону треугольника"
thirdSide = gets.chomp.to_f

sides = [firstSide, secondSide, thirdSide]
hypotenuse = sides.max
sides.delete(hypotenuse)


if sides.size == 2 && hypotenuse**2 == sides[0]**2 + sides[1]**2 
  puts "Да это же прямоугольный треугольник!"
  else puts "Треугольник не прямоугольный :("    
end    

if sides[0] == sides[1]
  puts "Треугольник равнобедренный!"
  else puts "Треугольник не равнобедренный :("
end