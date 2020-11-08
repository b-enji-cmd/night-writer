class Parser
  attr_reader :read_data
  def initialize
    @file_in = ARGV[0]
    @file_out = ARGV[1]
    @read_data = []
  end

  def parse_file
    in_file = File.open(@file_in,"r")
    in_file.each do |line|
      @read_data << line
    end
    @read_data
  end

  def write_data(data)
    out_file = File.new(@file_out,"w")
    out_file.write(data)
  end

  def word_count
    test = @read_data.flat_map(&:chars)
    test.delete(' ')
    test.delete('\n')
    p "Created '#{@file_out}' containing #{test.count} characters"
  end
end