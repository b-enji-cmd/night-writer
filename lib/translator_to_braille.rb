class TranslatorToBraille < TranslatorEngine
  attr_reader :data, :dictionary, :super_parser

  def initialize
    super
    @data = load_data
  end

  def translate
    letters = @data.flat_map do |line|
      line.split.flat_map(&:chars)
    end
    characters = []
    letters.each do |letter|
      characters << @dictionary[letter]
    end
    characters
  end

  def write_encoded
    first = translate.flatten(1)
    top = []
    mid = []
    bot = []

    first.each do |column|
        top << column[0]
        mid << column[1]
        bot << column[2]
    end
    top.append("NEWLINE")
    mid.append("NEWLINE")
    bot.append("NEWLINE")

    collector = []
    collector << top
    collector << mid
    collector << bot

    collector.each do |row|
      count = 0
      row.each do |char|
        if count == 79
          @super_parser.write_data("\n")
        else
          @super_parser.write_data(char)
        end
        count+=1
      end
    end

  end
end
#each with index handles taking the rows
# have the ling break after the 80th column
#





# potential strategies to refactor this method
# setting up rake to handle arguments
# how to test write method
# best way of handling line lengths that are greater than 80