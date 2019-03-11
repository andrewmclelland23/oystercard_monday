require "oystercard_exception"

class Oystercard
  MAX_BALANCE = 90
  attr_reader :balance

  def initialize
    @balance = 0
    @exception = OystercardException.new
  end

  def top_up(money)
    new_balance = @balance + money
    balance_limit_check(new_balance)
    @balance = new_balance
  end

  def balance_limit_check(balance)
    @exception.max_balance_exception(balance) unless balance <= MAX_BALANCE
  end

end
