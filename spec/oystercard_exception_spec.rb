require "oystercard_exception"

describe OystercardException do
  it "should raise standard error with specific message when max_balance_exception method is called" do
    expect { subject.max_balance_exception(10) }.to raise_error(StandardError, "Can't top up, balance is limited to £10")
  end
end
