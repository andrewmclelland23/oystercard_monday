require "oystercard"

describe Oystercard do
  it "should have a default balance of 0 when object is instantiated" do
    expect(subject.balance).to eq 0
  end
  it "should be able to top up balance by passing in a value into the top_up method" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end
end
