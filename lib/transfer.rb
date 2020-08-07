require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end 

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
  end 
end 

def reject_transfer
  self.status = "rejected"
  "Transaction rejected. Please check your account balance."
end 

def execute_transaction
  if valid? && sender.balance > self.amount && self.status == "pending"
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
    
  else sender.balance < self.amount
    self.reject_transfer
  end
end

def reverse_transfer
  if valid? && receiver.balance > self.amount && self.status == "complete"
    receiver.balance -= self.amount
    sender.balance += self.amount
    self.status = "reversed"
  else self.reject_transfer
  end
end

def self.all 
  @@all
end
 
end
