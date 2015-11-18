class Student < ActiveRecord::Base
  has_many :peer_evals
end
