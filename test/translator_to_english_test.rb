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

  def test_it_can_gather_letters
    expected = {"letter1"=>[".0", "00", "0."],
     "letter2"=>["00", ".0", ".."],
     "letter3"=>[".0", "0.", "0."],
     "letter4"=>[".0", "00", "0."],
     "letter5"=>[".0", "0.", ".."],
     "letter6"=>["00", ".0", "0."],
     "letter7"=>["00", "00", ".."]}
    assert_equal expected, @to_english.compare_pair
  end

  def test_it_can_decode_braille
    @to_english.translate

    @parser.close_file
  end

end