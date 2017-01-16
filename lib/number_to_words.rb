class NumberToWords
  ENGLISH_MAP = {
    0 => '',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety',
    100 => 'one hundred',
    200 => 'two hundred',
    300 => 'three hundred',
    400 => 'four hundred',
    500 => 'five hundred',
    600 => 'six hundred',
    700 => 'seven hundred',
    800 => 'eight hundred',
    900 => 'nine hundred'
  }.freeze

  DELIMITERS = ["", "thousand", "million", "billion", "trillion", "quadrillion", "quintrillion"]

  def self.convert_until_thousand(number)
    return ENGLISH_MAP[number] if ENGLISH_MAP[number]

    power = number.to_s.size - 1
    mod = number % (10**power)

    convert_until_thousand(number - mod) + ' ' + convert_until_thousand(mod)
  end

  def self.convert(number)
    return 'zero' if number.zero?
    ary = number.to_s.rjust(((number.to_s.size) / 3.0).ceil * 3, '0').scan(/.{3}/)

    ary.each_with_index.inject('') do |m, (element, index)|
      m << convert_until_thousand(element.to_i) + ' ' + DELIMITERS[ary.length - index - 1] + ' '
    end.strip
  end
end
