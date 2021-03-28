class Sign < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :favorites
  has_many :sign_tag_relations
  has_many :tags, through: :sign_tag_relations
  belongs_to :user
  belongs_to :state
  belongs_to :spot_type
  belongs_to :position
  belongs_to :characteristic
  belongs_to :content

  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :position_id
    validates :characteristic_id
    validates :content_id
  end

  def self.to_myself(current_user)
    user = current_user.personal_information
    Sign.where(first_name: user.first_name,
               last_name: user.last_name).or(Sign.where(first_name_kana: user.first_name_kana,
                                                        last_name_kana: user.last_name_kana))
  end

  def self.to_myself_kana(current_user)
    user = current_user.personal_information
    Sign.where(first_name_kana: user.first_name_kana, last_name_kana: user.last_name_kana)
  end

  def self.match_state_signs(current_user)
    user = current_user
    Sign.where(first_name: user.personal_information.first_name, last_name: user.personal_information.last_name,
               state_id: user.spot.state_id).or(Sign.where(first_name_kana: user.personal_information.first_name_kana,
                                                           last_name_kana: user.personal_information.last_name_kana, state_id: user.spot.state_id))
  end

  def self.match_city_signs(current_user)
    user = current_user
    Sign.where(first_name: user.personal_information.first_name, last_name: user.personal_information.last_name,
               state_id: user.spot.state_id, city: user.spot.city).or(Sign.where(first_name_kana: user.personal_information.first_name_kana,
                                                                                 last_name_kana: user.personal_information.last_name_kana, state_id: user.spot.state_id, city: user.spot.city))
  end

  def self.favorited_signs(current_user)
    user_signs = Sign.where(user_id: current_user.id)
    favorited_signs = []
    user_signs.each do |sign|
      favorited_signs << sign if Favorite.where(sign_id: sign.id).length >= 1
    end
    favorited_signs
  end

  def self.search(keywords, current_user)
    results = []
    user = current_user.personal_information
    signs_to_myself = Sign.where(first_name: user.first_name,
                                 last_name: user.last_name).or(Sign.where(first_name_kana: user.first_name_kana,
                                                                          last_name_kana: user.last_name_kana))
    senders = PersonalInformation.where(first_name: keywords[:first_name],
                                        last_name: keywords[:last_name]).or(PersonalInformation.where(first_name_kana: keywords[:first_name_kana],
                                                                                                      last_name_kana: keywords[:last_name_kana]))
    signs_to_myself.each do |sign|
      sign_user = sign.user.personal_information
      if sign_user.first_name == keywords[:first_name] && sign_user.last_name == keywords[:last_name] && sign[:state_id] == keywords[:state_id].to_i && sign[:city] == keywords[:city]
        results << sign
      elsif sign_user.first_name_kana == keywords[:first_name_kana] && sign_user.last_name_kana == keywords[:last_name_kana] && sign[:state_id] == keywords[:state_id].to_i && sign[:city] == keywords[:city]
        results << sign
      end
    end
    results
  end

  def self.favorite_signs(favorites)
    ids = []
    favorites.each { |f| ids << f[:sign_id] }
    favorite_signs = Sign.where(id: ids)
  end
end
