require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  def valid?
    sender.valid? && receiver.valid?
  end
  def execute_transaction
    # binding.pry
    if valid? && sender.balance >= amount && @status == "pending"
      sender.balance -= amount
      # binding.pry
      receiver.balance += amount
      # binding.pry
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    # binding.pry
  end

  def reverse_transfer
    # binding.pry
    if @status == "complete"
      receiver.balance -= amount
      # binding.pry
      sender.balance += amount
      @status = "reversed"
    end
  end

end
