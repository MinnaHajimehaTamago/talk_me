class BodyShape < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ふつう' },
    { id: 2, name: '太め' },
    { id: 3, name: '痩せ気味' },
    { id: 4, name: '筋肉質' }
  ]

  include ActiveHash::Associations
  has_many :appearances
end
