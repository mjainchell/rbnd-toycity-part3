#product.rb

class Product

  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def in_stock?
    stock > 0
  end

  private

  def add_to_products
    # Check for duplicate title
    if @@products.map {|product| product.title}.include? @title  # This line from Slack @david
      raise DuplicateProductError, "Duplicate Product Error: #{@title} already exists."
    else
      @@products<< self
    end
  end

  def self.find_by_title(the_title)
    @@products.find {|product| product.title == the_title}
  end


  def self.in_stock
    in_stock = []
    @@products.each do |product|
      if product.stock > 0
        in_stock << product
      end
    end

    return in_stock

  end
end



