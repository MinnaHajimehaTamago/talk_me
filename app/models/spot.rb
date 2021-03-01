class Spot < ApplicationRecord
  belongs_to :user

  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :state_id
    validates :spot_type_id
  end
  validates :city, presence: true
end
