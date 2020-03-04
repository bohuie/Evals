class Feedback < ActiveRecord::Base
  belongs_to :creator, class_name: :User 
  belongs_to :team 
  belongs_to :milestone
  validates :milestone, :team_id, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :q11, :oeq1, :oeq2, :oeq3, presence: true

  def sum
  	return q3+q4+q5+q6+q7+q8+q9+q10+q11
  end

  def total
  	return 9*5
  end
end
