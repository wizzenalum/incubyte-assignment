module StringCalculator
  def self.add(input)
    return 0 if input.empty?
    tokens = input.split(',')
    first_number, second_number = tokens[0].to_i, tokens[1]&.to_i || 0
    first_number + second_number
  end
end