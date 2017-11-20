class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.text :description
      t.string :icon, null: false

      t.timestamps null: false
    end

    add_index :sections, :name, unique: true
    add_index :sections, :icon, unique: true

    Section.create(name: 'Lo básico', description: 'Aquí aprenderás los aspectos básicos del lenguaje', icon: 'fa fa-rocket')
  end
end
