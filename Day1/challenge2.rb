# frozen_string_literal: true

input = File.open(File.join(__dir__, 'challenge1_input.txt'))
lines = input.readlines.map(&:chomp)
input.close

lines.each_with_index do |line, index|
  lines.each_with_index do |line2, index2|
    lines.each_with_index do |line3, index3|
      next if index == index2 || index2 == index3 || index == index3

      next unless (line.to_i + line2.to_i + line3.to_i) == 2020

      puts line.to_i * line2.to_i * line3.to_i
      break
    end
  end
end
