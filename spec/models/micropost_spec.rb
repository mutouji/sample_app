require 'rails_helper'

# RSpec.describe Micropost, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Micropost do
  let(:user) { FactoryGirl.create(:user) }
  before do
    # @micropost = Micropost.new(content: "Lorm ipsum", user_id: user.id)
    @micropost = user.microposts.build(content: "Lorm ipsum")
  end

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  it { should respond_to(:user) }
  # its(:user) { should eq user }
  it { expect(@micropost.user).to eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe "when blank content" do
    before { @micropost.content = nil }
    it { should_not be_valid}
  end

  describe "with content that is too long" do
    before { @micropost.content = "a" * 141 }
    it { should_not be_valid }
  end

end

