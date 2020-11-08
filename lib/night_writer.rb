require './lib/parser'
require './lib/translator_to_braille'
require './lib/translator_engine'
require './lib/translator_to_english'

night_writer = TranslatorEngine.new
night_writer.writer

