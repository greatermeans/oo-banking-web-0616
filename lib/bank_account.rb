require 'pry'

class BankAccount
  attr_accessor :balance, :open, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amt)
    @balance += amt
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?(amount=0)
    self.status == "open" && self.balance > amount ? true : false
  end

  def close_account
    @status = "closed"
  end


end
