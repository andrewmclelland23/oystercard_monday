class OystercardException

  def max_balance_exception(max_balance)
    raise(StandardError.new("Can't top up, balance is limited to £#{max_balance}"))
  end

end
