class Tag < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Private' },
    { id: 3, name: 'Work' }
  ]

  include ActiveHash::Associations
  has_many :goals
  end