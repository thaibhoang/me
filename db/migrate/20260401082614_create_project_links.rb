class CreateProjectLinks < ActiveRecord::Migration[8.1]
  def change
    create_table :project_links do |t|
      t.references :project, null: false, foreign_key: { on_delete: :cascade }
      t.string :kind, null: false
      t.string :label, null: false
      t.string :url, null: false
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_index :project_links, [ :project_id, :kind ]
    add_index :project_links, [ :project_id, :position ]
  end
end
