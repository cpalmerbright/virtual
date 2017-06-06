class User < ApplicationRecord

  attr_writer :first_name, :last_name, :balance_in_dollars, :transactions
  before_save :set_name, :set_balance, :set_transactions

  def split_name
    name ? name.split(' ') : ['','']
  end

  def first_name
    split_name[0]
  end

  def last_name
    split_name[1..split_name.length].join(' ')
  end

  def set_name
    self.name = "#{@first_name} #{@last_name}"
  end

  def balance_in_dollars
    balance_in_cents / 100
  end

  def set_balance
    self.balance_in_cents = @balance_in_dollars.to_f*100
  end

  def transactions
    included_transactions + paid_transactions
  end

  def set_transactions
    @transactions = @transactions.to_i
    if @transactions > 5
      self.included_transactions = 5
      self.paid_transactions = @transactions - 5
    else
      self.included_transactions = @transactions
      self.paid_transactions = 0
    end
  end
end
