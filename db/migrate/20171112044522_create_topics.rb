class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :unity, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
