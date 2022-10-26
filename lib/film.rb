class Film < Product
  attr_accessor :year
  def initialize(params)
    super
    @year = params[:year]
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path).map(&:chomp)
    self.new(
      name: lines[0],
      author: lines[1],
      year: lines[2].to_i,
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

  def to_s
    "Фильм '#{@name}', #{@year}, режиссер - #{@author}, #{@price} руб. (осталось #{@amount}) "
  end

  def to_s_end
    "Фильм '#{@name}', #{@year}, режиссер - #{@author}, #{@price} руб."
  end
end
