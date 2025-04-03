# String Calculator TDD Kata

This repository create string calculator while doing TDD.

## Tips

- Start with the simplest test case of an empty string and move to one and two numbers.
- Remember to solve problems in a simple manner so that you force yourself to write tests you did not think about.
- Remember to refactor after each passing test.

## Steps

Create a simple String calculator with a method signature like this:

```sh
int add(string numbers)
```

### Basic calculator

Input: a string of comma-separated numbers

Output: an integer, sum of the numbers

Examples:

Input: “”, Output: 0
Input: “1”, Output: 1
Input: “1,5”, Output: 6

### Support more numbers

Allow the add method to handle any amount of numbers.

### Support newline as separator

Allow the add method to handle new lines between numbers (instead of commas). ("1\n2,3" should return 6)

### Support different delimiters

To change the delimiter, the beginning of the string will contain a separate line that looks like this: "//[delimiter]\n[numbers…]". For example, "//;\n1;2" where the delimiter is ";" should return 3.

### Raise error for negative numbers

1. Calling add with a negative number will throw an exception: "negative numbers not allowed <negative_number>".

2. If there are multiple negative numbers, show all of them in the exception message, separated by commas.

### Ignore bigger numbers

Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2

### Support long delimiters

Delimiters can be of any length with the following format: “//[delimiter]\n” for example: “//[***]\n1**_2_**3” should return 6

### Support multiple delimiters

Allow multiple delimiters like this: “//[delim1][delim2]\n” for example “//[\*][%]\n1\*2%3” should return 6.

### Support long multiple delimiters

make sure you can also handle multiple delimiters with length longer than one char
