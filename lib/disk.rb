class Disk < Product
  attr_accessor :year, :genre
  def initialize(params)
    super
    @year = params[:year]
    @genre = params[:genre]
  end

  def to_s
    "Фильм '#{@name}', #{@year}, режиссер - #{@author}, #{@price} руб. (осталось #{@amount}) "
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path).map(&:chomp)
    self.new(
      name: lines[0],
      author: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def to_s
    "Альбом '#{@name}', #{@genre}, #{@year} года, автор - #{@author}, #{@price} руб. (осталось #{@amount}) "
  end

  def to_s_end
    "Альбом '#{@name}', #{@genre}, #{@year} года, автор - #{@author}, #{@price} руб."
  end
end

