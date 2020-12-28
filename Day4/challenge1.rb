# frozen_string_literal: true

file = File.open(File.join(__dir__, 'challenge_input.txt'))
line = nil

REQUIRED_FIELDS = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'].freeze
valid_count = 0
passports = []
passport = +''
loop do
  line = file.gets
  break if line.nil?

  if line.chomp == ''
    passports << passport
    passport = +''
    next
  end

  passport << line.chomp
  passport << ' '
end
file.close

passports.each do |passport_line|
  passport_fields = passport_line.split(' ')
  passport_map = {}
  passport_fields.each do |field_line|
    field = field_line.split(':')
    passport_map[field[0]] = field[1]
  end

  is_valid = true
  REQUIRED_FIELDS.each do |required_field|
    is_valid &= passport_map.key?(required_field)
  end
  valid_count += 1 if is_valid
end

puts valid_count
