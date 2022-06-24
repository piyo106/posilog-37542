class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Observe' },
    { id: 3, name: 'Orient' }
    { id: 4, name: 'Decide' }
    { id: 5, name: 'Act' }
  ]

  include ActiveHash::Associations
  has_many :logs
  end