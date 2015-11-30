class GroupEval < ActiveRecord::Base
  belongs_to :user 
  validates :milestone, :team, :presentation, :answering, :contribution, :questions, :strength, :weakness, presence: true
end
