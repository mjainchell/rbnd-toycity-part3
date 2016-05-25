#customer.rb

class Customer

  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def purchase(product)
   if product.in_stock?
    Transaction.new(self, product)
   else
     raise OutOfStockError, "Out Of Stock Error: #{product.title} is out of stock."
   end
  end

  private

  def add_to_customers
    # Check for duplicate customer
    if @@customers.map {|customer| customer.name}.include? @name
      raise DuplicateCustomerError, "Duplicate Customer Error: #{@name} already exists."
    else
      @@customers<<self
    end
  end

  def self.find_by_name(the_name)
    @@customers.find {|customer| customer.name == the_name}
  end

end