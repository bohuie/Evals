class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :peer_evals
  has_many :group_evals
  belongs_to :team

  validates :first_name, :last_name, presence: true

  def fullname
    "#{first_name} #{last_name}"
  end
end
