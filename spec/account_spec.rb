require 'account'

describe Account do
  it "exists (can be initialized)" do
    account = Account.new
    expect(account).to be
  end

  it "initializes with a balance of 0" do
    account = Account.new
    expect(account.balance). to eq(0)
  end
end