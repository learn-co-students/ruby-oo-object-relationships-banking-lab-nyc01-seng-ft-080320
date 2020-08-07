require 'pry'

class Transfer
  # your code here

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

def valid?
  self.sender.valid? && self.receiver.valid? 
end

def rejected
  self.status = "rejected"
  "Transaction rejected. Please check your account balance."
end


def execute_transaction
  if self.valid? && self.status == "pending"
    if self.sender.balance > self.amount
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.rejected
    end
  else
    self.rejected
  end
end

def reverse_transfer
  if self.status == "complete"
    self.status = "pending"
    self.amount *= -1
    self.execute_transaction
    self.status = "reversed"
  end
end


end


#Transaction rejected. Please check your account balance."