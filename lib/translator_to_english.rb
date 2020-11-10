#require './lib/translateable'
class TranslatorToEnglish < TranslatorEngine
  attr_reader :data, :dictionary, :super_parser
  def initialize
    super
    @data = load_data
  end

  def hash_swap
    @dictionary.invert
  end

  def translate


    collector = []
    top = []
    mid = []
    bot = []
    new_dictionary = hash_swap
    top << @data[0].delete("\n")
    mid << @data[1].delete("\n")
    bot << @data[2].delete("\n")
    @data.delete("\n")


    temp_data = top + mid + bot

    number_of_letters = (top.first.length / 2)

    collect = Hash.new{|h,k| h[k] = []}

    look_up = []


    @data.each do |row|
      count = 1
      # binding.pry
      row = row.delete("\n")
      until count > number_of_letters
        # binding.pry
        collect["letter#{count}"] << row[0..1]
        arr = row.chars
        arr.shift(2)
        row = arr.join
        count +=1
        #binding.pry
      end
     collect
    end
    l_column = []
    r_column = []
    collect.each do |k,v|
      v.each do |pair|
        l_column << pair[0]
        r_column << pair[1]
      end
      look_up << l_column << r_column
      binding.pry
    end
    binding.pry
  end



  def write_decoded
    words = translate.split
    words.each do |char|
      @super_parser.write_data(char)
    end
  end

end