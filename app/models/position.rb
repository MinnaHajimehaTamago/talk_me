class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '目印の場所を選択してください' },
    { id: 2, name: '頭に' },
    { id: 3, name: '手に' },
    { id: 4, name: '足に' },
    { id: 5, name: '胸に' },
    { id: 6, name: '腰に' }
  ]

  include ActiveHash::Associations
  has_many :signs
end