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

  it "Should have a hard-coded total?" do
    feedback = build(:feedback)
    expect(feedback.total).to eq 45
  end

  it "Should sum the q1 through q11" do
    feedback = build(:feedback)
    feedback.q1 = 1
    feedback.q2 = 2
    feedback.q3 = 3
    feedback.q4 = 4
    feedback.q5 = 5
    feedback.q6 = 6
    feedback.q7 = 7
    feedback.q8 = 8
    feedback.q9 = 9
    feedback.q10 = 10
    feedback.q11 = 11
    expect(feedback.sum).to eq 63
  end

end