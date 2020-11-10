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

  def assign_rows
    rows = []
    top = []
    mid = []
    bot = []
    first = translate.flatten(1)
    first.each do |column|
      top << column[0]
      mid << column[1]
      bot << column[2]
    end
    top.append("\n")
    mid.append("\n")
    bot.append("\n")
    rows << top << mid << bot
  end

  def write_encoded
    translated_data = assign_rows
    top_row = translated_data[0]
    middle_row = translated_data[1]
    bottom_row = translated_data[2]

    top_slice = []
    mid_slice = []
    bot_slice = []

    top_row.each_slice(80) do |split_point|
      top_slice << split_point
    end
    middle_row.each_slice(80) do |split_point|
      mid_slice << split_point
    end
    bottom_row.each_slice(80) do |split_point|
      bot_slice << split_point
    end

    if top_row.count > 80
      top_slice[0].append("\n")
      mid_slice[0].append("\n")
      bot_slice[0].append("\n")
    end


    top_slice[0].each do |char|
      @super_parser.write_data(char)
    end
    mid_slice[0].each do |char|
      @super_parser.write_data(char)
    end
    bot_slice[0].each do |char|
      @super_parser.write_data(char)
    end
    if top_row.count > 80
      top_slice[1].each do |char|
        @super_parser.write_data(char)
      end
      mid_slice[1].each do |char|
        @super_parser.write_data(char)
      end
      bot_slice[1].each do |char|
        @super_parser.write_data(char)
      end
    end


  end
end

#top[80]
#  mid[80]
#   bot[80]