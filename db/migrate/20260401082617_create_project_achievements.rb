class CreateProjectAchievements < ActiveRecord::Migration[8.1]
  def change
    create_table :project_achievements do |t|
      t.references :project, null: false, foreign_key: { on_delete: :cascade }
      t.string :title, null: false
      t.text :description
      t.string :icon
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_index :project_achievements, [ :project_id, :position ]
  end
end
