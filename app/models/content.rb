class Content < ActiveHash::Base
  self.data = [
    { id: 1, name: 'サインの内容を選択してください' },
    { id: 2, name: '話そう' },
    { id: 3, name: '遊ぼう' },
    { id: 4, name: '飲みにいこう' },
    { id: 5, name: 'ランチしよう' },
    { id: 6, name: '謝りたい' }
  ]

  include ActiveHash::Associations
  has_many :signs
end