class Product
  attr_accessor :price, :amount, :name, :author

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
    @name = params[:name]
    @author = params[:author]
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end

  def amount?
    @amount != 0
  end

  def sell!
    @amount -= 1
  end
end
