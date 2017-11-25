class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :unity, index: true, foreign_key: true
      t.text :content
      t.integer :ups
      t.integer :downs

      t.timestamps null: false
    end
  end
end
