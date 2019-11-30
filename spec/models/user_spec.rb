require 'rails_helper'

describe User, type: :model do

  describe 'associations' do
    it { should belong_to(:team) }
    it { should have_many(:peer_evals) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  it "Should instantiate" do
    user = build(:user)
  end
end

FactoryBot.define do
  factory :user do
    first_name { "Jane" }
    last_name {"Doe" }
    admin { false }
    
  end
end