class Milestone < ActiveRecord::Base
    validates :description, presence: true
end
  