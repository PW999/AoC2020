#frozen_string_literal: true

input = File.open(File.join(__dir__, 'challenge_input.txt'))
data = input.readlines.map(&:chomp)
input.close


class PasswordPolicy
  def initialize(line)
    line_with_replacements = line.dup
    line_with_replacements['-'] = ' '
    line_array = line_with_replacements.split(' ')
    @min = line_array[0].to_i
    @max = line_array[1].to_i
    @char = line_array[2]
  end

  def validate_policy(password)
    count = password.count(@char)
    (count >= @min && count <= @max)
  end

end

valid = 0
data.each do |line|
  policy_password = line.split(': ')
  policy = PasswordPolicy.new(policy_password[0])

  valid+=1 if policy.validate_policy(policy_password[1])
end
puts valid
