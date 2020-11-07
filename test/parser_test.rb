require './lib/parser'
require 'minitest/autorun'
require 'pry'

class ParserTest < Minitest::Test
  def setup
    @parser = Parser.new
  end

  def test_it_is
    assert_instance_of Parser, @parser
  end

  def test_it_can_open_files
    @parser.parse_file
    assert_instance_of String, @parser.read_data[0]
    assert_instance_of String, @parser.read_data[-1]
  end
end