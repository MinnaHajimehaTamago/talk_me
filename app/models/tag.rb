class Tag < ApplicationRecord
  has_many :user_tag_relations
  has_many :users, through: :user_tag_relations
  has_many :signs, through: :sign_tag_relations

  validates :name, uniqueness: { case_sensitive: false }, presence: true, presence: { message: 'は１つ以上追加してください' }
  validates :officiality_id, presence: true, format: { with: /[0-2]/ , message: "は0~2の間で入力してください" }
end
