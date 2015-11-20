class Student < ActiveRecord::Base
  has_many :peer_evals

  def fullname
    "#{first_name} #{last_name}"
  end
end
