require "oystercard"

describe Oystercard do
  it "should have a default balance of 0 when object is instantiated" do
    expect(subject.balance).to eq 0
  end
end
