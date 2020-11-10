require './lib/parser'
require './lib/translator_engine'
require './lib/translator_to_braille'
require './lib/translator_to_english'
require 'pry'

night_writer = TranslatorEngine.new
night_writer.load_data
night_writer.super_parser.word_count
braille = TranslatorToBraille.new
braille.translate
braille.write_encoded