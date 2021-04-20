class Sign < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :sign_tag_relations, dependent: :destroy
  has_many :tags, through: :sign_tag_relations
  belongs_to :user

  validates :text, presence: true

  # def self.to_myself(current_user)
  #   user = current_user.personal_information
  #   Sign.where(first_name: user.first_name,
  #              last_name: user.last_name).or(Sign.where(first_name_kana: user.first_name_kana,
  #                                                       last_name_kana: user.last_name_kana))
  # end

  # def self.to_myself_kana(current_user)
  #   user = current_user.personal_information
  #   Sign.where(first_name_kana: user.first_name_kana, last_name_kana: user.last_name_kana)
  # end

  # def self.match_state_signs(current_user)
  #   user = current_user
  #   Sign.where(first_name: user.personal_information.first_name, last_name: user.personal_information.last_name,
  #              state_id: user.spot.state_id).or(Sign.where(first_name_kana: user.personal_information.first_name_kana,
  #                                                          last_name_kana: user.personal_information.last_name_kana, state_id: user.spot.state_id))
  # end

  # def self.match_city_signs(current_user)
  #   user = current_user
  #   Sign.where(first_name: user.personal_information.first_name, last_name: user.personal_information.last_name,
  #              state_id: user.spot.state_id, city: user.spot.city).or(Sign.where(first_name_kana: user.personal_information.first_name_kana,
  #                                                                                last_name_kana: user.personal_information.last_name_kana, state_id: user.spot.state_id, city: user.spot.city))
  # end

  # def self.favorited_signs(current_user)
  #   user_signs = Sign.where(user_id: current_user.id)
  #   favorited_signs = []
  #   user_signs.each do |sign|
  #     favorited_signs << sign if Favorite.where(sign_id: sign.id).length >= 1
  #   end
  #   favorited_signs
  # end

  # def self.favorite_signs(favorites)
  #   ids = []
  #   favorites.each { |f| ids << f[:sign_id] }
  #   favorite_signs = Sign.where(id: ids)
  # end

  def self.search(keywords, current_user)
    names = keywords[:names].uniq
    tag_ids = []
    names.each do |name|
      tag = Tag.find_by(name: name)
      tag_ids << tag[:id] unless tag == nil
    end
    sign_ids = []
    tag_ids.each do |tag_id|
      sign_ids << SignTagRelation.where(tag_id: tag_id)
    end
    signs = []
    sign_ids.flatten.uniq.each do |sign|
      signs << Sign.includes(:tags).find(sign.sign_id)
    end
    signs -= current_user.signs
    results = []
    signs.each do |sign|
      sign_tags = []
      sign_tags_match_count = 0
      sign.tags.each do |tag|
        sign_tags_match_count += 1 if tag_ids.count(tag.id) >= 1
        sign_tags << tag.id
      end
      # サインのマッチ率
      match_rate = 0.7
      results << sign if sign_tags_match_count / sign.tags.length >= match_rate
      results << sign if sign_tags_match_count / tag_ids.length >= match_rate
    end
    return results.uniq.sort_by { |a| a[:created_at] }.reverse
  end

  def self.match_signs(current_user)
    tag_ids = []
    current_user.user_tag_relations.each do |user_tag|
      tag_ids << user_tag.tag_id
    end
    sign_ids = []
    tag_ids.each do |tag_id|
      sign_ids << SignTagRelation.where(tag_id: tag_id)
    end
    signs = []
    sign_ids.flatten.uniq.each do |sign|
      signs << Sign.includes(:tags, :user).find(sign.sign_id)
    end
    signs -= current_user.signs
    results = []
    signs.each do |sign|
      sign_tags = []
      sign_tags_match_count = 0
      sign.tags.each do |tag|
        sign_tags_match_count += 1 if tag_ids.count(tag.id) >= 1
        sign_tags << tag.id
      end
      match_rate = 0.7
      results << sign if sign_tags_match_count / sign.tags.length >= match_rate
      results << sign if sign_tags_match_count / tag_ids.length >= match_rate
    end
    return results.uniq.sort_by { |a| a[:created_at] }.reverse
  end
end
