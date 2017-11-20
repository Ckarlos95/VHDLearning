class CreateUnities < ActiveRecord::Migration
  def change
    create_table :unities do |t|
      t.references :section, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end

    add_index :unities, :name, unique: true

    Unity.create(section_id: 1, name: 'Introducción', description: 'Una breve introducción a VHDL')
  end
end
