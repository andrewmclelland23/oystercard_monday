require "oystercard"

describe Oystercard do

max_balance_error = StandardError.new("Can't top up, balance is limited to £#{Oystercard::MAX_BALANCE}")

  # Following block stubs the OystercardException object that is set as the instance variable @exception
  before(:each) do
    oystercard_exception = instance_double("OystercardException")
    allow(oystercard_exception).to receive(:max_balance_exception).and_raise(max_balance_error)
    subject.instance_variable_set(:@exception, oystercard_exception)
  end

  it "should have a default balance of 0 when object is instantiated" do
    expect(subject.balance).to eq 0
  end
  it "should be able to top up balance by passing in a value into the top_up method" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end
  it "should raise exception if top up will increase balance to greater than MAX_BALANCE" do
    expect { subject.top_up(Oystercard::MAX_BALANCE + 1) }.to raise_error(StandardError, "Can't top up, balance is limited to £#{Oystercard::MAX_BALANCE}")
  end
  it "should not update balance if top up will increase balance to greater than MAX_BALANCE" do
    subject.top_up(Oystercard::MAX_BALANCE - 1)
    expect { subject.top_up(Oystercard::MAX_BALANCE + 1) }.to raise_error(StandardError, "Can't top up, balance is limited to £#{Oystercard::MAX_BALANCE}")
    expect(subject.balance).to eq Oystercard::MAX_BALANCE - 1
  end
end
