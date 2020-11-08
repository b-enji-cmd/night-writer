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

  def write_test
    first = translate
    second = first.flatten(1)
    top = []
    mid = []
    bot = []
    second.each_with_index do |column, iteration|
      if iteration == 80
        @super_parser.write_data("\n")
      else
        top << column[0]
        mid << column[1]
        bot << column[2]
      end
    end
    top.append("\n")
    mid.append("\n")
    bot.append("\n")

    top.each do |char|
      @super_parser.write_data(char)
    end
    mid.each do |char|
      @super_parser.write_data(char)
    end
    bot.each do |char|
      @super_parser.write_data(char)
    end
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