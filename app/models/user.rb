class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :personal_information
  has_one :spot
  has_many :signs
  has_many :favorites
  has_many :user_tag_relations
  has_many :tags, through: :user_tag_relations
  has_one_attached :image

  validates :nickname, presence: true
end
