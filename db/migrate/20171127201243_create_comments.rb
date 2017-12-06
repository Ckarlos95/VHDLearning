class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :unity, index: true, foreign_key: true
      t.text :content, null: false
      t.integer :ups, default: 0
      t.integer :downs, default: 0

      t.timestamps null: false
    end
  end
end
