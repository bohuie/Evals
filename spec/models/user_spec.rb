require 'rails_helper'

describe User, type: :model do

  describe 'associations' do
    it { should belong_to(:team) }
    it { should have_many(:peer_evals) }
    it { should have_many(:peer_evals).class_name('PeerEval') }
    it { should have_many(:group_evals) }
    it { should have_many(:feedbacks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  it "Should display fullname correctly" do
    user = build(:user)
    expect(user.fullname).to eq "Jane Doe"
  end

  it "Should save once all parameters are set" do
    user = build(:valid_user)
    user.save!
    expect(user.id).to be_kind_of(Integer)
  end

  it "Should validate e-mail address is correct" do
    user = build(:valid_user)
    user.email = "invalid"
    expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "Should fail saving the user until all parameters are set" do
    user = build(:user)
    expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

end
