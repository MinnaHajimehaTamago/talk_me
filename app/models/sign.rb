class Sign < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :favorites
  belongs_to :user

  belongs_to :state
  belongs_to :spot_type
  belongs_to :position
  belongs_to :characteristic
  belongs_to :content

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
  
  def self.to_myself(current_user)
    user = current_user.personal_information
    Sign.where(first_name: user.first_name, last_name: user.last_name).or(Sign.where(first_name_kana: user.first_name_kana, last_name_kana: user.last_name_kana))
  end

  def self.search(keywords, current_user)
    results = []
    user = current_user.personal_information
    signs_to_myself = Sign.where(first_name: user.first_name, last_name: user.last_name).or(Sign.where(first_name_kana: user.first_name_kana, last_name_kana: user.last_name_kana))
    senders = PersonalInformation.where(first_name: keywords[:first_name], last_name: keywords[:last_name]).or(PersonalInformation.where(first_name_kana: keywords[:first_name_kana], last_name_kana: keywords[:last_name_kana]))
    signs_to_myself.each do |sign|
      sign_user = sign.user.personal_information
      if sign_user.first_name == keywords[:first_name] && sign_user.last_name == keywords[:last_name] && sign[:state_id] == keywords[:state_id].to_i && sign[:city] == keywords[:city]
        results << sign
      elsif sign_user.first_name_kana == keywords[:first_name_kana] && sign_user.last_name_kana == keywords[:last_name_kana] && sign[:state_id] == keywords[:state_id].to_i && sign[:city] == keywords[:city]
        results << sign
      end
    end
    return results
  end

  def self.favorite_signs(favorites)
    ids = []
    favorites.each { |f| ids << f[:sign_id] }
    favorite_signs = Sign.where(id: ids)
  end

end
