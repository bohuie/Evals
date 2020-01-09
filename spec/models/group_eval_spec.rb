require 'rails_helper'

describe GroupEval, type: :model do

  describe 'associations' do
    it { should belong_to(:team) }
    it { should belong_to(:creator).class_name("User") }
    it { should belong_to(:milestone) }
  end

  describe 'validations' do
    it { should validate_presence_of(:milestone) }
    it { should validate_presence_of(:team_id) }
    it { should validate_presence_of(:presentation) }
    it { should validate_presence_of(:answering) }
    it { should validate_presence_of(:contribution) }
    it { should validate_presence_of(:questions) }
    it { should validate_presence_of(:strength) }
    it { should validate_presence_of(:weakness) }
  end


end