class PeerEval < ActiveRecord::Base
  belongs_to :user 
  validates :milestone, :goals, :quality, :effort, :considerate, :knowledge, :sharing, :strength, :weakness, presence: true
end
