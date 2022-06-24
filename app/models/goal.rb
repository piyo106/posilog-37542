class Goal < ApplicationRecord
  validates :title, :purpose, presence: true
  validates :tag_id, numericality: { other_than: 1, message: "を選択してください" }

  has_many :logs

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag
end
