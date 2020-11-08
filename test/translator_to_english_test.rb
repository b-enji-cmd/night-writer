require './lib/parser'
require './lib/translator_engine'
require './lib/translator_to_english'
require 'minitest/autorun'
require 'pry'

class TranslatorToEnglishTest < Minitest::Test
  def setup
    @super_translator = TranslatorEngine.new
    @to_english = TranslatorToEnglish.new
  end

  def test_it_is
    assert_instance_of TranslatorToEnglish, @to_english
  end

  def test_it_can_swap_keys_and_values
    assert_instance_of Array, @to_english.dictionary.values
  end

end