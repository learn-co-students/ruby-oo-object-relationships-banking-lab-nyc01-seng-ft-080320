class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, transfer_amount) 
    @sender = sender 
    @receiver = receiver 
    @amount = transfer_amount 
    @status = 'pending'
  end
  
  def valid?
    if self.sender.valid? && self.receiver.valid?
      true 
    else false 
    end 
  end 
  
  def execute_transaction
    if self.status == 'pending' && self.sender.status == 'open' && self.receiver.status == 'open' && self.sender.balance >= self.amount
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = 'complete'
    else 
      self.status ='rejected'
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer 
    if self.status == 'complete'
      self.sender.balance += self.amount 
      self.receiver.balance -= self.amount 
      self.status = 'reversed'
    end 
  end 
end