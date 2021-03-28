class SignsTag
  include ActiveModel::Model
  attr_accessor :position_id, :characteristic_id, :content_id, :user_id, :names

  validates :names, presence: true
  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :position_id
    validates :characteristic_id
    validates :content_id
  end

  def save
    sign = Sign.create(position_id: position_id, characteristic_id: characteristic_id, content_id: content_id, user_id: user_id)
    names.uniq.each do |name|
      tag = Tag.where(name: name).first_or_initialize
      tag.save
      SignTagRelation.create(sign_id: sign.id, tag_id: tag.id)
    end
  end
end