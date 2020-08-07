class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  def valid?
    BankAccount.all.select do |name|
      if name.valid? == @sender ||= @receiver
        return true
    end
  end
  return false
  end
  def execute_transaction

  end
end
