require 'rails_helper'

describe PeerEval, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:creator).class_name("User") }
    it { should belong_to(:milestone) }
  end

  describe 'validations' do
    it { should validate_presence_of(:milestone) }
    it { should validate_presence_of(:goals) }
    it { should validate_presence_of(:quality) }
    it { should validate_presence_of(:effort) }
    it { should validate_presence_of(:considerate) }
    it { should validate_presence_of(:knowledge) }
    it { should validate_presence_of(:sharing) }
    it { should validate_presence_of(:strength) }
    it { should validate_presence_of(:weakness) }
  end


end