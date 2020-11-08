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

  def fixture_file_for_writing_data
    data_collector = ""
    incoming_text = @parser.parse_file
    incoming_text.each do |line|
      data_collector += line
    end
    data_collector
  end

  def test_it_can_write_to_file
    test_data = fixture_file_for_writing_data
    assert @parser.write_data(test_data)
  end

  def test_it_can_return_word_count_cli
    @parser.parse_file
    assert_equal "Created 'braille.txt' containing 10 characters", @parser.word_count
  end
end