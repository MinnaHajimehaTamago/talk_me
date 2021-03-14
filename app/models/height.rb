class Height < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ふつう' },
    { id: 2, name: '高い' },
    { id: 3, name: '小さい' }
  ]

  include ActiveHash::Associations
  has_many :appearances
end
