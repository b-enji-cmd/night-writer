#require './lib/translateable'
class TranslatorToEnglish < TranslatorEngine
  attr_reader :data, :dictionary, :super_parser
  def initialize
    super
    @data = load_data
  end

  def compare_pair
    collect = Hash.new{|h,k| h[k] = []}
    number_of_letters = (@data[0].delete("\n").length / 2)
    @data.each do |row|
      count = 1
      row = row.delete("\n")
      until count > number_of_letters
        collect["letter#{count}"] << row[0..1]
        arr = row.chars
        arr.shift(2)
        row = arr.join
        count +=1
      end
    end
    collect
  end


  def translate
    collect = compare_pair
    lookup = ""
    new_dictionary = @dictionary.invert
    looks_for = Hash.new{|h,k| h[k] = []}
    l_column = []
    r_column = []
    county = 0

    collect.each do |k,v|
      v.each do |pair|
        l_column << pair[0]
        r_column << pair[1]
        county+=1
      end
      looks_for["#{county}"] << l_column << r_column
      l_column = []
      r_column = []
    end

    looks_for.each_value do |pair|
      lookup += new_dictionary[pair]
    end
    @super_parser.write_data(lookup)
  end
end