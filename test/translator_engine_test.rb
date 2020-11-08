require './lib/parser'
require './lib/translator_engine'
require 'minitest/autorun'
require 'pry'

class TranslatorEngineTest < Minitest::Test
  def setup
    @super_translator = TranslatorEngine.new
  end

  def test_it_is
    assert_instance_of TranslatorEngine, @super_translator
  end

  def test_it_starts_with_a_dictionary
    assert_instance_of Array, @super_translator.dictionary.keys
  end
end