class CreateSocialLinks < ActiveRecord::Migration[8.1]
  def change
    create_table :social_links do |t|
      t.references :profile, null: false, foreign_key: { on_delete: :cascade }
      t.string :platform, null: false
      t.string :url, null: false
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_index :social_links, [ :profile_id, :platform ], unique: true
    add_index :social_links, [ :profile_id, :position ]
  end
end
