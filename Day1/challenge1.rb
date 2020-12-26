# frozen_string_literal: true

input = File.open(File.join(__dir__, 'challenge1_input.txt'))
lines = input.readlines.map(&:chomp)
input.close

lines.each_with_index do |line, index|
  lines.each_with_index do |line2, index2|
    next if index == index2

    next unless (line.to_i + line2.to_i) == 2020

    puts line.to_i * line2.to_i
    break
  end
end
