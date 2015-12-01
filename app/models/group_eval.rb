class GroupEval < ActiveRecord::Base
  belongs_to :user 
  belongs_to :team 
  validates :milestone, :team_id, :presentation, :answering, :contribution, :questions, :strength, :weakness, presence: true
end
