arr = [1, 1]
loop do
  incoming = arr[-2] + arr[-1]
  break if incoming > 100
  arr << incoming
end

puts arr
