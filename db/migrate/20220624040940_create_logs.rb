class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.text       :content,     null: false
      t.references :goal,        null: false, foreign_key: true
      t.integer    :category_id, null: false
      t.timestamps
    end
  end
end
