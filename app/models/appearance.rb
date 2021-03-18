class Appearance < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :hair
  belongs_to :eye_shape
  belongs_to :eye_size
  belongs_to :nose_shape
  belongs_to :nose_size
  belongs_to :mouth_shape
  belongs_to :mouth_size
  belongs_to :height
  belongs_to :body_shape
  belongs_to :gender

  belongs_to :user

  def self.appearance_image(params)
    image = ""
    params.values.each do |id|
      image << id
    end
    return image
  end

end
