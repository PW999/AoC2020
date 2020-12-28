# frozen_string_literal: true

file = File.open(File.join(__dir__, 'challenge_input.txt'))
line = nil

REQUIRED_FIELDS = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'].freeze
valid_count = 0
passports = []
passport = +''
loop do
  line = file.gets
  if line.nil?
    passports << passport
    break
  end

  if line.chomp == '' || line.chomp == ' '
    passports << passport
    passport = +''
    next
  end

  passport << line.chomp
  passport << ' '
end
file.close

def validate_year(input, min, max)
  yr = input.to_i
  yr >= min && yr <= max
end

def validate_height(input)
  return false if (input =~ /1?\d\d(in|cm)/).nil?

  if !input['cm'].nil?
    cm = input.dup
    cm['cm'] = ''
    cm.to_i >= 150 && cm.to_i <= 193
  else
    inch = input.dup
    inch['in'] = ''
    inch.to_i >= 59 && inch.to_i <= 76
  end
end

def validate_hair_color(input)
  input =~ /#[0-9a-f]{6}/
end

def validate_eye_color(input)
  input =~ /(amb|blu|brn|gry|grn|hzl|oth)/
end 

def validate_pid(input)
  input =~ /^\d{9}$/
end

def validate(passport)
  is_valid = true
  is_valid &= validate_year(passport['byr'], 1920, 2002)
  is_valid &= validate_year(passport['iyr'], 2010, 2020)
  is_valid &= validate_year(passport['eyr'], 2020, 2030)
  is_valid &= validate_height(passport['hgt'])
  is_valid &= validate_hair_color(passport['hcl'])
  is_valid &= validate_eye_color(passport['ecl'])
  is_valid &= validate_pid(passport['pid'])
  p passport if is_valid
  is_valid
end

passports.each do |passport_line|
  passport_fields = passport_line.split(' ')
  passport_fields = passport_fields.sort
  passport_map = {}
  passport_fields.each do |field_line|
    field = field_line.split(':')
    passport_map[field[0]] = field[1]
  end

  is_valid = true
  REQUIRED_FIELDS.each do |required_field|
    is_valid &= passport_map.key?(required_field)
  end
  valid_count += 1 if is_valid && validate(passport_map)
end

puts valid_count
