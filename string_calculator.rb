module StringCalculator
  def self.add(input)
    numbers = parse_add_input(input)
    numbers.sum
  end

  private

  def self.parse_add_input(input)
    return parse_add_input_delimited(input) if input.start_with?('//')
    input_with_comma_separator = input.gsub('\n', ',')
    str_to_int_array_by_delimiter(input_with_comma_separator, ',' )
  end

  def self.parse_add_input_delimited(input)
    delimiter_string, numbers_string = input.split('\n')
    delimiter = delimiter_string[2..]
    str_to_int_array_by_delimiter(numbers_string, delimiter )
  end

  def self.str_to_int_array_by_delimiter(string, delimiter)
    tokens = string.split(delimiter)
    tokens.map { |token| token.strip.to_i}
  end
end