class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance >= self.amount
      self.receiver.deposit(self.amount)
      self.sender.balance -= self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end





end
