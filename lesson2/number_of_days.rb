months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "День:"
day = gets.chomp.to_i

puts "Месяц:"
month = gets.chomp.to_i - 1

puts "Год:"
year = gets.chomp.to_i

months[1] = 29 if year % 4 == 0 && year % 100 != 0 || year % 400 == 0

total = day
month -= 1

while month >= 0
  total += months[month]
  month -= 1
end

puts "Days gone: #{total}"
