# frozen_string_literal: true

require 'bigdecimal/util'

input = File.open(File.join(__dir__, 'challenge_input.txt'))
rows = input.readlines.map(&:chomp)
input.close

rows.each_with_index do |row, index|
  rows[index] = row.split('')
end
rows.freeze

def run_slope(rows, down, right)
  max_row_index = rows[0].size - 1
  x=0
  y=-1
  trees=0
  rows.each do |row|
    y += 1
    next unless (y % down) == 0

    c = row[x % (max_row_index + 1)]
    trees+=1 if c == '#'
    x += right
  end
  trees.to_d
end

r1_1 = run_slope(rows, 1, 1)
r1_3 = run_slope(rows, 1, 3)
r1_5 = run_slope(rows, 1, 5)
r1_7 = run_slope(rows, 1, 7)
r2_1 = run_slope(rows, 2, 1)

result = r1_1 * r1_3 * r1_5 * r1_7 * r2_1
puts result.to_s("F")
