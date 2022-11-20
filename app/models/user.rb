class User < ApplicationRecord
  # has_many :following, foreign_key: "follower_id", class_name: "Relationship"
  # has_many :followers, foreign_key: "followed_id", class_name: "Relationship"

  # The first line enables a user to follow many other users. 
  # It allows the foreign key follower_id to be accessed from the Follow class. 
  # The user’s ID can then be associated to the follow as the follower. 
  # The second: a user has many followees through the followed_users established.
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Relationship'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Relationship'
  has_many :followers, through: :following_users


  validates :name, :birthday, presence: true
  validates_each :birthday do |record, attr, value|
    record.errors.add(attr, 'must be in the past') if value >= Time.now.to_date
  end
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

end
