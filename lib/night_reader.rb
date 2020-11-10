require './lib/parser'
require './lib/translator_engine'
require './lib/translator_to_braille'
require './lib/translator_to_english'
require 'pry'

night_reader = TranslatorEngine.new
night_reader.load_data
night_reader.super_parser.word_count
english = TranslatorToEnglish.new
english.translate
