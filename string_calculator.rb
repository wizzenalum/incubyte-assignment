module StringCalculator
  def self.add(input)
    numbers = parse_add_input(input)
    numbers.sum
  end

  private

  def self.parse_add_input(input)
    return parse_add_input_delimited(input) if input.start_with?('//')
    input_with_comma_separator = input.gsub('\n', ',')
    tokens = input_with_comma_separator.split(',')
    tokens.map { |token| token.to_i}
  end

  def self.parse_add_input_delimited(input)
    delimiter_token, numbers_token = input.split('\n')
    delimiter = delimiter_token[2..]
    tokens = numbers_token.split(delimiter)
    tokens.map { |token| token.to_i}
  end
end