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

  def test_it_can_get_data_from_parser
    assert_instance_of Array, @to_braille.data
  end

  def test_it_can_handle_data
    assert_instance_of Array, @to_braille.translate
  end

  def test_it_can_translate_letters_to_braille
    assert_instance_of String, @to_braille.translate[0][0][0]
  end

end