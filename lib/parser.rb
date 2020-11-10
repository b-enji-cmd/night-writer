class Parser
  attr_reader :read_data, :in_file, :out_file
  def initialize
    @file_in = ARGV[0]
    @file_out = ARGV[1]
    @in_file = File.open(@file_in,"r")
    @out_file = File.open(@file_out,"w")
    @read_data = []
  end

  def parse_file
    @in_file.each do |line|
      @read_data << line
    end
    @read_data
  end

  def write_data(data)
    @out_file.write(data)
  end

  def close_file
    @out_file.close
    @in_file.close
  end

  def word_count
    character_count = @read_data.flat_map(&:chars)
    character_count.delete(' ')
    character_count.delete('\n')
    p "Created '#{@file_out}' containing #{character_count.count} characters"
  end
end