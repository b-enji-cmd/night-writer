require 'simplecov'
SimpleCov.start
require './lib/parser'
require './lib/translator_engine'
require './lib/translator_to_braille'
require './lib/translator_to_english'
require 'minitest/autorun'
require 'mocha/minitest'
require 'pry'
