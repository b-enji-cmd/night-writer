require './test/test_helper'

class TranslatorToBrailleTest < Minitest::Test
  def setup
    @parser = Parser.new
    @super_translator = TranslatorEngine.new
    @to_braille = TranslatorToBraille.new
  end

  def test_it_is
    assert_instance_of TranslatorToBraille, @to_braille
  end

  def test_it_can_inherit_from_super
    assert @to_braille.super_parser
    assert @to_braille.dictionary
  end

  def test_it_can_handle_data
    assert_instance_of Array, @to_braille.translate
  end

  def test_it_can_translate_letters_to_braille
    assert_instance_of String, @to_braille.translate[0][0][0]
  end


  def test_it_can_write_to_file
    @to_braille.write_encoded
    @parser.close_file
  end

end