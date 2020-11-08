require './lib/parser'
require './lib/translator_engine'
require './lib/translator_to_braille'
require 'minitest/autorun'
require 'mocha/minitest'
require 'pry'

class TranslatorToBrailleTest < Minitest::Test
  def setup
    @super_translator = TranslatorEngine.new
    @to_braille = TranslatorToBraille.new
  end

  def test_it_is
    assert_instance_of TranslatorToBraille, @to_braille
  end

  def test_it_can_inherit_from_super
    assert @to_braille.super_parser
    assert @to_braille.dictionary
    assert @to_braille.data
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

  def test_it_can_write_to_file
    @to_braille.write_test
    #assert_equal "encoded braille", @to_braille.stubs(:write_encoded).returns("encoded braille")
  end

end