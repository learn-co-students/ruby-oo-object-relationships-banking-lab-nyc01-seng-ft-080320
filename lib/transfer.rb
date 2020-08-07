class Transfer
  attr_accessor :receiver, :sender, :amount, :status

  def initialize(sender, receiver, amount)
    self.sender = sender 
    self.receiver = receiver 
    self.amount = amount 
    self.status = "pending"
  end 
  
  def valid?
    if self.sender.valid? && self.receiver.valid? 
      true 
    else 
      false 
    end
  end

  ##self.sender.balance will decrease, self.receiver.balance increase
  ##2 bank account each has balance- transfer one to the other 
  #if transaction complete don't need to check for balance
  def execute_transaction
    # if self.status == "pending"
    #   if self.sender.valid? && self.sender.balance >= self.amount
      
    #     self.sender.balance -= self.amount
    #     self.receiver.balance += self.amount
    #     self.status = "complete"
    #   else
    #     "Transaction rejected. Please check your account balance."
    #   end
    # else
    #   "this transaction has been completed before"
    # end
    if self.status == "complete"
      puts "this transaction is complete"
      
    elsif self.status == "pending"
      if self.sender.valid?
        puts "this transaction: #{self} status is #{self.status}"
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
        puts "now this transaction: #{self} status is #{self.status} "
      else
        puts "the sender account is not valid"
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  #if complete so valid then return amount 
  def reverse_transfer 
    if self.status == "complete"
      self.receiver.balance -= self.amount 
      self.sender.balance += self.amount
      self.status = "reversed"
    end
  end

end