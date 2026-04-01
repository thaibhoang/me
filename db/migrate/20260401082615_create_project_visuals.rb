class CreateProjectVisuals < ActiveRecord::Migration[8.1]
  def change
    create_table :project_visuals do |t|
      t.references :project, null: false, foreign_key: { on_delete: :cascade }
      t.string :title
      t.text :caption
      t.string :image_url, null: false
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_index :project_visuals, [ :project_id, :position ]
  end
end
