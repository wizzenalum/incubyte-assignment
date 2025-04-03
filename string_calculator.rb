module StringCalculator
  def self.add(input)
    return 0 if input.empty?
    tokens = input.split(',')
    numbers = tokens.map { |token| token.to_i}
    numbers.sum
  end
end