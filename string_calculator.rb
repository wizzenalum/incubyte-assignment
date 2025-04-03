module StringCalculator
  def self.add(input)
    numbers = parse_add_input(input)
    validate_add_numbers(numbers)
    valid_numbers = numbers.filter{ |number| number <= 1000}
    valid_numbers.sum
  end

  private

  def self.parse_add_input(input)
    return parse_add_input_delimited(input) if input.start_with?('//')
    input_with_comma_separator = input.gsub('\n', ',')
    str_to_int_array_by_delimiter(input_with_comma_separator, ',' )
  end

  def self.parse_add_input_delimited(input)
    delimiter_string, numbers_string = input.split('\n')
    delimiter_string_without_prefix = delimiter_string[2..]
    delimiters = [delimiter_string_without_prefix]
    delimiters = delimiter_string_without_prefix.scan(/\[(.)\]/).flatten if delimiter_string_without_prefix.start_with?('[')
    str_to_int_array_by_delimiter(numbers_string, delimiters )
  end

  def self.str_to_int_array_by_delimiter(string, delimiters)
    separator_regex = Regexp.union(delimiters)
    tokens = string.split(separator_regex)
    tokens.map { |token| token.strip.to_i}
  end

  def self.validate_add_numbers(numbers)
    negative_numbers = numbers.filter{ |number| number < 0 }
    return if negative_numbers.empty?
    raise ArgumentError.new("negative numbers not allowed <#{negative_numbers.join(' ')}>")
  end
end