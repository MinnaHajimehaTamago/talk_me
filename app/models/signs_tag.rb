class SignsTag
  include ActiveModel::Model
  attr_accessor :text, :user_id, :names

  with_options presence: true do
    validates :text
    validates :names, presence: { message: 'は１つ以上追加してください' }
  end

  def save
    sign = Sign.create(text: text, user_id: user_id)
    names.uniq.each do |name|
      tag = Tag.where(name: name).first_or_initialize
      tag.save
      SignTagRelation.create(sign_id: sign.id, tag_id: tag.id)
    end
  end
end
