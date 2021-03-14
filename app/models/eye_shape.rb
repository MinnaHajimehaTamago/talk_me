class EyeShape < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ふつう' },
    { id: 2, name: 'つり目' },
    { id: 3, name: 'たれ目' }
  ]

  include ActiveHash::Associations
  has_many :appearances
end
