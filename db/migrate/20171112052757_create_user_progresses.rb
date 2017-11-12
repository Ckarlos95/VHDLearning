class CreateUserProgresses < ActiveRecord::Migration
  def change
    create_table :user_progresses do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :topic, index: true, foreign_key: true, null: false #, default: 1
      t.integer :xp, default: 0
      t.integer :level, default: 1

      t.timestamps null: false
    end
  end
end
