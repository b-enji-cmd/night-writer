class TranslatorToBraille < TranslatorEngine
  attr_reader :data, :dictionary, :super_parser

  def initialize
    super
    @data = load_data
  end

  def translate
    encoded = {}
    letters = @data.flat_map do |line|
      line.split.flat_map(&:chars)
    end
    letters.each do |letter|
      encoded[letter] = @dictionary[letter]
    end
    encoded.values
  end

  def write_encoded
    new_words = translate
    new_words.each do |letter|
      l_column = letter[0].join
      r_column = letter[1].join
      @super_parser.write_data(l_column)
      @super_parser.write_data(r_column)

    end
  end
end