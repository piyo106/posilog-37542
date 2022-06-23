class Goal < ApplicationRecord
  validates :title, :purpose, presence: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :tag_id
  end
end
