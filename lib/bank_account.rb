require "pry"
class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        self.name = name 
        self.balance = 1000
        self.status = "open"
    end

    def deposit(amount)
        self.balance += amount 
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        #binding.pry
        if self.status == "open" && self.balance > 0
            true 
        else
            false 
        end     
    end

    def close_account
        if self.valid?
            self.status = "closed"
        else 
            "This account is closed"
        end
    end 

    private
    ## can't change name would fail without this - created writer as private
    def name=(name)
        @name = name 
    end 
end