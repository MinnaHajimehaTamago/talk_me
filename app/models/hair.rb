class Hair < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ショート' },
    { id: 2, name: 'ミディアム' },
    { id: 3, name: 'ロング' }
  ]

  include ActiveHash::Associations
  has_many :appearances
end
