module StringCalculator
  def self.add(input)
    tokens = input.split(',')
    numbers = tokens.map { |token| token.to_i}
    numbers.sum
  end
end