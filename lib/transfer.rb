require 'pry'
require_relative 'bank_account.rb'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

   def initialize(sender, receiver, status = 'pending', amount)
     @sender = sender
     @receiver = receiver
     @status = status
     @amount = amount
     @@all << self 
   end 

   def self.all
     @@all
   end 
   #instance methods

   def execute_transaction
    if sender.balance > amount && self.status == 'pending'
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end

    if sender.balance < amount || !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
    # binding.pry
   end 

   def valid?
     sender.valid? && receiver.valid?
   end 

   def reverse_transfer
     if self.status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
     end
   end 

end

  # avi = BankAccount.new("Avi") 
  # amanda = BankAccount.new("Amanda") 
  # terrance = BankAccount.new("Terrance") 
  # Transfer.new(amanda, avi, 50) 
  # Transfer.new(amanda, avi, 4000) 


# binding.pry
