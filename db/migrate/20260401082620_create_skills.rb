class CreateSkills < ActiveRecord::Migration[8.1]
  def change
    create_table :skills do |t|
      t.references :profile, null: false, foreign_key: { on_delete: :cascade }
      t.string :group_name, null: false
      t.string :name, null: false
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_index :skills, [ :profile_id, :group_name, :position ]
  end
end
