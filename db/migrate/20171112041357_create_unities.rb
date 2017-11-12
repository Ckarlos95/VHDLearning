class CreateUnities < ActiveRecord::Migration
  def change
    create_table :unities do |t|
      t.references :section, index: true, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end

    # add_index :unities, [:id, ]
    add_index :unities, :name, unique: true
  end
end
