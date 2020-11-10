require './lib/translateable'
class TranslatorEngine
  include Translateable
  attr_reader :dictionary, :super_parser, :night_writer, :night_reader
  def initialize
    @super_parser = Parser.new
    @dictionary = create_alphabet
  end


  def load_data
    @super_parser.parse_file
    #@super_parser.word_count
  end

  def write(data)
    @super_parser.write_data(data)
  end

end
