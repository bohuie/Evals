class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :peer_evals
  has_many :created_peer_evals, class_name: "PeerEval", foreign_key: "creator_id"
  has_many :group_evals, foreign_key: "creator_id"
  belongs_to :team
  has_many :feedbacks

  validates :first_name, :last_name, presence: true

  def fullname
    "#{first_name} #{last_name}"
  end
end
