class Team < ActiveRecord::Base
  has_many :users
  has_many :group_evals
  has_many :feedbacks
end
