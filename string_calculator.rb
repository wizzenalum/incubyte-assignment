module StringCalculator
  def self.add(input)
    numbers = parse_input(input)
    validate_numbers(numbers)
    valid_numbers = numbers.filter{ |number| number <= 1000}
    valid_numbers.sum
  end

  private

  def self.parse_input(input)
    numbers_string = input
    delimiters = ['\n', ',']
    if input.start_with?('//')
      delimiter_string, numbers_string = input.split('\n')
      delimiter_string_without_prefix = delimiter_string[2..]
      delimiters = get_delimiters(delimiter_string_without_prefix)
    end 
    str_to_int_array_by_delimiter(numbers_string, delimiters)
  end

  def self.get_delimiters(delimiter_string)
    delimiters = [delimiter_string]
    delimiters = delimiter_string.scan(/\[(.*?)\]/).flatten if delimiter_string.start_with?('[')
    delimiters
  end

  def self.str_to_int_array_by_delimiter(string, delimiters)
    separator_regex = Regexp.union(delimiters)
    tokens = string.split(separator_regex)
    tokens.map { |token| token.strip.to_i}
  end

  def self.validate_numbers(numbers)
    negative_numbers = numbers.filter{ |number| number < 0 }
    return if negative_numbers.empty?
    raise ArgumentError.new("negative numbers not allowed <#{negative_numbers.join(' ')}>")
  end
end