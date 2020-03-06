class GroupEval < ActiveRecord::Base
  belongs_to :creator, class_name: "User" 
  belongs_to :team
  belongs_to :milestone
  validates :milestone, :team_id, :presentation, :answering, :contribution, :questions, :strength, :weakness, presence: true
end
