class TranslatorToBraille < TranslatorEngine
  attr_reader :data, :dictionary, :parser

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
    @parser.write_data(new_words)
  end



end