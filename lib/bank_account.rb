class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end

  def deposit(deposit_amt)
    self.balance += deposit_amt
  end  

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def self.all
    @@all
  end

  def close_account
    if self.status == "open"
      self.status = "closed"
    end
  end

end
