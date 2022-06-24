class Log < ApplicationRecord
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }

  belongs_to :goal

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
