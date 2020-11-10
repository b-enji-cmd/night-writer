require './test/test_helper'

class TranslatorToEnglishTest < Minitest::Test
  def setup
    @parser = Parser.new
    @super_translator = TranslatorEngine.new
    @to_english = TranslatorToEnglish.new
  end

  def test_it_is
    assert_instance_of TranslatorToEnglish, @to_english
  end

  def test_it_can_swap_keys_and_values
    @to_english.hash_swap
    assert_instance_of Array, @to_english.dictionary.values
  end

  def test_it_can_decode_braille
    @to_english.translate
    @to_english.write_decoded
    @parser.close_file
  end

end