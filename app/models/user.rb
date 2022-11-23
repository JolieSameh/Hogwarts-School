class User < ApplicationRecord

  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end 
  
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Relationship'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Relationship'
  has_many :followers, through: :following_users


  validates :name, :birthday, presence: true

  validates_date :birthday,  on_or_before: :today
  
  password_requirment = /\A
  (?=.{8,})
  (?=.*\d)
  (?=.*[a-z])
  (?=.*[A-Z])
  /x
  validates :password, format: password_requirment

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spells

  #has_one_attached :profile_picture, dependent: :destroy

end
