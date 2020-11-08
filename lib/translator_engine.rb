class TranslatorEngine
  attr_reader :dictionary
  def initialize
    @super_parser = Parser.new
    @dictionary = create_alphabet
    @night_writer = TranslatorToBraille.new
    @night_reader = TranslatorToEnglish.new
  end
  def create_alphabet
    {
      "a" => [%w[0 . .], %w[. . .]],
      "b" => [%w[0 0 .], %w[. . .]],
      "c" => [%w[0 . .], %w[0 . .]],
      "d" => [%w[0 . .], %w[0 0 .]],
      "e" => [%w[0 . .], %w[0 0 .]],
      "f" => [%w[0 0 .], %w[0 . .]],
      "g" => [%w[0 0 .], %w[0 0 .]],
      "h" => [%w[0 0 .], %w[. 0 .]],
      "i" => [%w[. 0 .], %w[0 . .]],
      "j" => [%w[. 0 .], %w[0 0 .]],
      "k" => [%w[0 . 0], %w[. . .]],
      "l" => [%w[0 0 0], %w[. . .]],
      "m" => [%w[0 . 0], %w[0 . .]],
      "n" => [%w[0 . 0], %w[0 0 .]],
      "o" => [%w[0 . 0], %w[. 0 .]],
      "p" => [%w[0 0 0], %w[0 . .]],
      "q" => [%w[0 0 0], %w[0 0 .]],
      "r" => [%w[0 0 0], %w[. 0 .]],
      "s" => [%w[. 0 0], %w[0 . .]],
      "t" => [%w[. 0 0], %w[0 0 .]],
      "u" => [%w[0 . 0], %w[. . 0]],
      "v" => [%w[0 0 0], %w[. . 0]],
      "w" => [%w[. 0 .], %w[0 0 0]],
      "x" => [%w[0 . 0], %w[0 . 0]],
      "y" => [%w[0 . 0], %w[0 0 0]],
      "z" => [%w[0 . 0], %w[. 0 0]],
    }
  end

  def load_data
    @super_parser.parse_file
  end

  def writer
    @night_writer.write_encoded
  end

  def reader
    @night_reader.write_encoded
  end

  def close
    @super_parser.close_files
  end
end
