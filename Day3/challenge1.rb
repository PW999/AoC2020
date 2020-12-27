# frozen_string_literal: true

input = File.open(File.join(__dir__, 'challenge_input.txt'))
rows = input.readlines.map(&:chomp)
input.close

rows.each_with_index do |row, index|
  rows[index] = row.split('')
end

max_row_index = rows[0].size - 1
x=0
trees=0
rows.each do |row|
  c = row[x % (max_row_index + 1)]
  trees+=1 if c == '#'
  row[x % (max_row_index + 1)] = 'O'
  row.each do |char|
    print char
  end
  puts trees
  x += 3
end

puts trees
