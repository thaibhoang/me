class CreateProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :summary, null: false
      t.text :challenge
      t.text :solution
      t.integer :status, null: false, default: 0
      t.datetime :published_at
      t.boolean :featured, null: false, default: false
      t.string :meta_title
      t.text :meta_description

      t.timestamps
    end

    add_index :projects, :slug, unique: true
    add_index :projects, [ :status, :published_at ]
    add_check_constraint :projects, "status IN (0, 1)", name: "projects_status_check"
  end
end
