class Feedback < ActiveRecord::Base
  belongs_to :user 
  belongs_to :team 
  validates :milestone, :team_id, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :q11, :oeq1, :oeq2, :oeq3, presence: true
end
