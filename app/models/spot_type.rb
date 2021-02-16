class SpotType < ActiveHash::Base
  self.data = [
    { id: 1, name: 'よく会う場所の特徴を選択してください' },
    { id: 2, name: '学校' },
    { id: 3, name: '職場' },
    { id: 4, name: '公園' },
    { id: 5, name: '喫茶店' },
    { id: 6, name: 'マクドナルド' }
  ]

  include ActiveHash::Associations
  has_many :signs
end