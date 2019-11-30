require 'rails_helper'

describe Feedback, type: :model do

  describe 'associations' do
    it { should belong_to(:team) }
    it { should belong_to(:creator).class_name(:User) }
  end

  describe 'validations' do
    it { should validate_presence_of(:milestone) }
    it { should validate_presence_of(:team_id) }
    it { should validate_presence_of(:q1) }
    it { should validate_presence_of(:q2) }
    it { should validate_presence_of(:q3) }
    it { should validate_presence_of(:q4) }
    it { should validate_presence_of(:q5) }
    it { should validate_presence_of(:q6) }
    it { should validate_presence_of(:q7) }
    it { should validate_presence_of(:q8) }
    it { should validate_presence_of(:q9) }
    it { should validate_presence_of(:q10) }
    it { should validate_presence_of(:q11) }
    it { should validate_presence_of(:oeq1) }
    it { should validate_presence_of(:oeq2) }
    it { should validate_presence_of(:oeq3) }
  end

  it "Should have a hard-coded total?", skip: true do
    feedback = build(:feedback)
    expect(feedback.total).to eq 45
    expect(feedback.sum).to eq 0
  end

end