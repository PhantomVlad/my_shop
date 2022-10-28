class Book < Product
  attr_accessor :type
  def initialize(params)
    super
    @type = params[:type]
    @author = params[:author]
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path).map(&:chomp)
    self.new(
      name: lines[0],
      author: lines[2],
      type: lines[1],
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end
  def to_s
    "Книга '#{@name}', #{@type}, автор - #{@author}, #{@price} руб. (осталось #{@amount}) "
  end


  def info
    "Книга '#{@name}', #{@type}, автор - #{@author}"
  end
end
