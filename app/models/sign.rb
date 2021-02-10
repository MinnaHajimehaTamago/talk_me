class Sign < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :spot_type
  belongs_to :position
  belongs_to :characteristic
  belongs_to :content

  belongs_to :user

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力してください' }
    validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力してください' }
    validates :city
  end

  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :state_id
    validates :spot_type_id
    validates :position_id
    validates :characteristic_id
    validates :content_id
  end
  

end
