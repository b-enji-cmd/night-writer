class TranslatorEngine
  attr_reader :dictionary
  def initialize
    @super_parser = Parser.new
    @dictionary = create_alphabet
  end
  def create_alphabet
    {
        "a" => [%W[0 . .], %W[. . .]],
        "b" => [%W[0 0 .], %W[. . .]],
        "c" => [%W[0 . .], %W[0 . .]],
        "d" => [%W[0 . .], %W[0 0 .]],
        "e" => [%W[0 . .], %W[0 0 .]],
        "f" => [%W[0 0 .], %W[0 . .]],
        "g" => [%W[0 0 .], %W[0 0 .]],
        "h" => [%W[0 0 .], %W[. 0 .]],
        "i" => [%W[. 0 .], %W[0 . .]],
        "j" => [%W[. 0 .], %W[0 0 .]],
        "k" => [%W[0 . 0], %W[. . .]],
        "l" => [%W[0 0 0], %W[. . .]],
        "m" => [%W[0 . 0], %W[0 . .]],
        "n" => [%W[0 . 0], %W[0 0 .]],
        "o" => [%W[0 . 0], %W[. 0 .]],
        "p" => [%W[0 0 0], %W[0 . .]],
        "q" => [%W[0 0 0], %W[0 0 .]],
        "r" => [%W[0 0 0], %W[. 0 .]],
        "s" => [%W[. 0 0], %W[0 . .]],
        "t" => [%W[. 0 0], %W[0 0 .]],
        "u" => [%W[0 . 0], %W[. . 0]],
        "v" => [%W[0 0 0], %W[. . 0]],
        "w" => [%W[. 0 .], %W[0 0 0]],
        "x" => [%W[0 . 0], %W[0 . 0]],
        "y" => [%W[0 . 0], %W[0 0 0]],
        "z" => [%W[0 . 0], %W[. 0 0]],
    }
  end
  def load_data
    @super_parser.parse_file
  end

  def write_data(data)
    @super_parser.write_data(data)
  end
end
