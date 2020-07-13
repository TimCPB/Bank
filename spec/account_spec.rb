require 'account'

describe Account do

  context "A new account is set up" do
    account = Account.new

    it "exists (can be initialized)" do
      expect(account).to be
    end

    it "initializes with a balance of 0" do
      expect(account.balance). to eq(0)
    end
  end
end
