module StringCalculator
  def self.add(input)
    numbers = parse_add_input(input)
    numbers.sum
  end

  private

  def self.parse_add_input(input)
    input_with_comma_separator = input.gsub('\n', ',')
    tokens = input_with_comma_separator.split(',')
    tokens.map { |token| token.to_i}
  end
end