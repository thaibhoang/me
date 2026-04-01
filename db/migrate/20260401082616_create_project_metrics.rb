class CreateProjectMetrics < ActiveRecord::Migration[8.1]
  def change
    create_table :project_metrics do |t|
      t.references :project, null: false, foreign_key: { on_delete: :cascade }
      t.string :name, null: false
      t.string :legacy_value
      t.string :improved_value
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_index :project_metrics, [ :project_id, :position ]
  end
end
