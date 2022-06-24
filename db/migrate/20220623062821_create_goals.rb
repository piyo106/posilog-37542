class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string  :title,   null: false
      t.string  :purpose, null: false
      t.integer :tag_id,  null: false
      t.timestamps
    end
  end
end
