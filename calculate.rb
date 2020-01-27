class Calculate

  @@number_hashmap = {
      "zero" => 0,
      "one" => 1,
      "two" => 2,
      "three" => 3,
      "four" => 4,
      "five" => 5,
      "six" => 6,
      "seven" => 7,
      "eight" => 8,
      "nine" => 9
  }

  def calculate_average(string)
    return 'n/a' if string.empty?

    number_array = to_numbers(string)
    return 'n/a' if number_array.empty? || !check_valid_array(number_array)

    @@number_hashmap.key(computate_average(number_array))
  end

  def to_numbers(string)
    string_array = string.split(' ')
    numbers = string_array.map do |str|
      return [] if @@number_hashmap[str].nil?
      @@number_hashmap[str]
    end
    numbers
  end

  def computate_average(int_array)
    int_array.inject(:+) / int_array.length
  end

  def check_valid_array(array)
    return array.all? {|i| i.is_a?(Integer) } && !array.empty?
  end
end