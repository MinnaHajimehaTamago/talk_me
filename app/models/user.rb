class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :appearance
  has_many :signs, dependent: :destroy
  has_many :user_tag_relations
  has_many :tags, through: :user_tag_relations
  has_many :room_user_relations
  has_many :rooms, through: :room_user_relations
  has_one_attached :image

  validates :nickname, presence: true
end
