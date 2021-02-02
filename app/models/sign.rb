class Sign < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :spot_type
  belongs_to :position
  belongs_to :characteristic
  belongs_to :content

  belongs_to :user
end
