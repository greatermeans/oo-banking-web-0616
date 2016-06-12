class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @runs = 1
  end

  def valid?
    @sender.valid?(amount) && receiver.valid? ? true : false
  end

  def execute_transaction

    if self.valid? == true && @runs > 0
      @sender.deposit(-amount)
      @receiver.deposit(amount)
      @status = 'complete'
      @runs -= 1
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if @runs == 0
      @sender.deposit(amount)
      @receiver.deposit(-amount)
      @status = "reversed"
    end
  end


end
