require './lib/parser'
require './lib/translator_engine'
require './lib/translator_to_braille'
require 'minitest/autorun'
require 'pry'

class TranslatorEngineTest < Minitest::Test
  def setup
    @super_translator = TranslatorEngine.new
    @to_braille = TranslatorToBraille.new
  end

  def test_it_is
    assert_instance_of TranslatorEngine, @super_translator
  end

  def test_it_starts_with_a_dictionary
    assert_instance_of Array, @super_translator.dictionary.keys
  end

  def test_it_inherits_from_super
    assert_instance_of TranslatorToBraille, @to_braille
  end

  def test_it_can_super_attributes
    assert_instance_of Array, @to_braille.dictionary.keys
  end

end