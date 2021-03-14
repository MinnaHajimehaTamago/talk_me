class MouthShape < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ふつう' },
    { id: 2, name: '厚い' },
    { id: 3, name: '薄い' }
  ]

  include ActiveHash::Associations
  has_many :appearances
end
