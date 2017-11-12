class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.text :description
      t.string :icon

      t.timestamps null: false
    end
  end
end
