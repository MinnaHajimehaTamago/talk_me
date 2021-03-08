class Characteristic < ActiveHash::Base
  self.data = [
    { id: 1, name: '目印の特徴を選択したください' },
    { id: 2, name: '赤いアクセサリー' },
    { id: 3, name: '黄色いアクセサリー' },
    { id: 4, name: '青いアクセサリー' },
    { id: 5, name: '緑のアクセサリー' },
    { id: 6, name: '紫のアクセサリー' }
  ]

  include ActiveHash::Associations
  has_many :signs
end
