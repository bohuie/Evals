class PeerEval < ActiveRecord::Base
  belongs_to :user 
  belongs_to :creator, class_name: "User"
  belongs_to :milestone
  validates :milestone, :goals, :quality, :effort, :considerate, :knowledge, :sharing, :strength, :weakness, presence: true
end
