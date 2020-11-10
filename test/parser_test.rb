require './test/test_helper'

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


  def test_it_can_write_to_file
    #test = @parser.parse_file
    test = ".\n0\n."

    assert @parser.write_data(test)
  end

  def test_it_can_return_word_count_cli
    @parser.parse_file
    assert_equal "Created 'braille.txt' containing 5 characters", @parser.word_count
  end
end