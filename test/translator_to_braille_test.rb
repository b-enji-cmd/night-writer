require './lib/parser'
require './lib/translator_engine'
require './lib/translator_to_braille'
require 'minitest/autorun'
require 'pry'

class TranslatorToBrailleTest < Minitest::Test
  def setup
    @super_translator = TranslatorEngine.new
    @to_braille = TranslatorToBraille.new
  end

  def test_it_is
    assert_instance_of TranslatorToBraille, @to_braille
  end

end