class Sign < ApplicationRecord
  has_many :sign_tag_relations, dependent: :destroy
  has_many :tags, through: :sign_tag_relations
  belongs_to :user

  validates :text, presence: true

  def self.search(keywords, current_user)
    names = keywords[:names].uniq
    tag_ids = []
    names.each do |name|
      tag = Tag.find_by(name: name)
      tag_ids << tag[:id] unless tag.nil?
    end
    sign_ids = []
    tag_ids.each do |tag_id|
      sign_ids << SignTagRelation.where(tag_id: tag_id)
    end
    signs = []
    sign_ids.flatten.uniq.each do |sign|
      signs << Sign.find(sign.sign_id)
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
    results.uniq.sort_by { |a| a[:created_at] }.reverse
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
      signs << Sign.find(sign.sign_id)
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
    results.uniq.sort_by { |a| a[:created_at] }.reverse
  end
end
