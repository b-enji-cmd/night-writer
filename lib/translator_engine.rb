class TranslatorEngine
  attr_reader :dictionary
  def initialize
    @parser = Parser.new
    @dictionary = create_alphabet
  end

  def create_alphabet
    {
        "a" => [%W[0\n .\n .\n], %W[.\n .\n .\n]],
        "b" => [%W[0\n 0\n .\n], %W[.\n .\n .\n]],
        "c" => [%W[0\n .\n .\n], %W[0\n .\n .\n]],
        "d" => [%W[0\n .\n .\n], %W[0\n 0\n .\n]],
        "e" => [%W[0\n .\n .\n], %W[0\n 0\n .\n]],
        "f" => [%W[0\n 0\n .\n], %W[0\n .\n .\n]],
        "g" => [%W[0\n 0\n .\n], %W[0\n 0\n .\n]],
        "h" => [%W[0\n 0\n .\n], %W[.\n 0\n .\n]],
        "i" => [%W[.\n 0\n .\n], %W[0\n .\n .\n]],
        "j" => [%W[.\n 0\n .\n], %W[0\n 0\n .\n]],
        "k" => [%W[0\n .\n 0\n], %W[.\n .\n .\n]],
        "l" => [%W[0\n 0\n 0\n], %W[.\n .\n .\n]],
        "m" => [%W[0\n .\n 0\n], %W[0\n .\n .\n]],
        "n" => [%W[0\n .\n 0\n], %W[0\n 0\n .\n]],
        "o" => [%W[0\n .\n 0\n], %W[.\n 0\n .\n]],
        "p" => [%W[0\n 0\n 0\n], %W[0\n .\n .\n]],
        "q" => [%W[0\n 0\n 0\n], %W[0\n 0\n .\n]],
        "r" => [%W[0\n 0\n 0\n], %W[.\n 0\n .\n]],
        "s" => [%W[.\n 0\n 0\n], %W[0\n .\n .\n]],
        "t" => [%W[.\n 0\n 0\n], %W[0\n 0\n .\n]],
        "u" => [%W[0\n .\n 0\n], %W[.\n .\n 0\n]],
        "v" => [%W[0\n 0\n 0\n], %W[.\n .\n 0\n]],
        "w" => [%W[.\n 0\n .\n], %W[0\n 0\n 0\n]],
        "x" => [%W[0\n .\n 0\n], %W[0\n .\n 0\n]],
        "y" => [%W[0\n .\n 0\n], %W[0\n 0\n 0\n]],
        "z" => [%W[0\n .\n 0\n], %W[.\n 0\n 0\n]],
    }
  end
end