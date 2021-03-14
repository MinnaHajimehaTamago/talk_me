class MouthSize < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ふつう' },
    { id: 2, name: '大きい' },
    { id: 3, name: '小さい' }
  ]

  include ActiveHash::Associations
  has_many :appearances
end
