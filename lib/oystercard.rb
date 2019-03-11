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
    @exception.max_balance_exception(MAX_BALANCE) unless new_balance <= MAX_BALANCE
    @balance = new_balance
  end

end
