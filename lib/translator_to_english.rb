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
    #
     top = []
    # mid = []
    # bot = []
     new_dictionary = hash_swap
     top << @data[0].delete("\n")
    # mid << @data[1].delete("\n")
    # bot << @data[2].delete("\n")
    # @data.delete("\n")

     size = @data[0].delete("\n")
     number_of_letters = (top.first.length / 2)
     collect = Hash.new{|h,k| h[k] = []}
     look_up = []

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

     looks = Hash.new{|h,k| h[k] = []}
     l_column = []
     r_column = []
     county = 0
     collect.each do |k,v|
       v.each do |pair|
         l_column << pair[0]
         r_column << pair[1]
         county+=1
       end
       looks["#{county}"] << l_column << r_column
       l_column = []
       r_column = []

       #
     end
    fancy = ""
    looks.values.each do |pair|
      fancy += new_dictionary[pair]
    end
    @super_parser.write_data(fancy)
  end



  def write_decoded
    words = translate.split
    words.each do |char|
      @super_parser.write_data(char)
    end
  end

end