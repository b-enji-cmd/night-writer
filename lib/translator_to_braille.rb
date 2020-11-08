class TranslatorToBraille < TranslatorEngine
  attr_reader :data

  def initialize
    super
    @data = load_data
  end

  def translate
    encoded = Hash.new
    letters = @data.flat_map do |line|
      line.split.flat_map(&:chars)
    end
    letters.each do |letter|
      encoded[letter] = @dictionary[letter]
    end
    encoded.values
  end

end