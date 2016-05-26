#transaction.rb

class Transaction

  attr_reader :id, :product, :customer

  @@id = 1
  @@transactions = []



  def initialize(customer, product)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    product.amend_stock
    add_to_transactions
  end


  def self.all
    @@transactions
  end

  def add_to_transactions
    if product.in_stock?
      @@transactions << self
    else
      raise OutOfStockError, "Out Of Stock Error: #{product.title} is out of stock."
    end
  end


  def self.find(product_id)
    @@transactions.find {|transaction| transaction.id == product_id}
  end



end