alph = ('a'..'z').to_a
vowels = %w([ a e i o u ])
result = {}

alph.each_index do |index|
  letter = alph[index]
  result[letter] = index + 1 if vowels.include?(letter)
end

puts result
