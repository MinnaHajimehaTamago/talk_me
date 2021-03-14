class NoseShape < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ふつう' },
    { id: 2, name: '高い' },
    { id: 3, name: '低い' },
    { id: 4, name: '丸い' }
  ]

  include ActiveHash::Associations
  has_many :appearances
end
