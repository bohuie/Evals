require 'rails_helper'

describe Team, type: :model do

  describe 'associations' do
    it { should have_many(:users) }
    it { should have_many(:group_evals) }
    it { should have_many(:feedbacks) }
  end

end