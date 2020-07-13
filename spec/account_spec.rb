require 'account'

describe Account do
  it "exists (can be initialized)" do
    account = Account.new
    expect(account).to be
  end
end