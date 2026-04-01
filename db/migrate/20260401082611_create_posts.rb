class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :excerpt, null: false
      t.text :content, null: false
      t.integer :status, null: false, default: 0
      t.datetime :published_at
      t.boolean :featured, null: false, default: false
      t.references :category, null: true, foreign_key: { on_delete: :nullify }
      t.string :meta_title
      t.text :meta_description

      t.timestamps
    end

    add_index :posts, :slug, unique: true
    add_index :posts, :status
    add_index :posts, :published_at
    add_index :posts, [ :status, :published_at ]
    add_check_constraint :posts, "status IN (0, 1)", name: "posts_status_check"
  end
end
