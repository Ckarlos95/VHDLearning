class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :unity, index: true, foreign_key: true, null: false
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
