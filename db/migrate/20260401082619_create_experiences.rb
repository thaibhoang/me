class CreateExperiences < ActiveRecord::Migration[8.1]
  def change
    create_table :experiences do |t|
      t.references :profile, null: false, foreign_key: { on_delete: :cascade }
      t.string :role, null: false
      t.string :company, null: false
      t.date :start_on
      t.date :end_on
      t.text :description
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_index :experiences, [ :profile_id, :position ]
    add_index :experiences, [ :profile_id, :start_on ]
  end
end
