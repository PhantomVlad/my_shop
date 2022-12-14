class ProductCollection
  TYPE_PRODUCTION = {
    "films": Film,
    "books": Book,
    "disks": Disk
  }

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(data_path)
    products = []
    TYPE_PRODUCTION.each do |hash|
      files_path_one_category = Dir["#{data_path}/#{hash[0]}/*.txt"]
      files_path_one_category.each {|files_path| products << TYPE_PRODUCTION[hash[0]].from_file(files_path)}
    end
    self.new(products)
  end

  def to_a
    @products
  end

  def sort_collection!(params)
    case params[:sort_method]
    when "1"
      @products.sort_by!(&:name)
    when "2"
      @products.sort_by!(&:author)
    when "3"
      @products.sort_by!(&:amount)
    when "4"
      @products.sort_by!(&:price)
    when "5"
      @products.sort_by!(&:to_s)
    end

    @products.reverse! if params[:input_reverse] == "r"
    self
  end

  def to_s
    @products.map.with_index(1) {|product, index| "#{index}. #{product}"}.join("\n")
  end

  def product_by_index(input_index)
    @products.to_a[input_index - 1]
  end

  def remove_out_of_stock!
    @products.select! {|product| product.amount != 0}
  end

  def size
    @products.size
  end
end


