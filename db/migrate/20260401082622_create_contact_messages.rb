class CreateContactMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :contact_messages do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :subject, null: false
      t.text :message, null: false
      t.integer :status, null: false, default: 0
      t.string :source_page

      t.timestamps
    end

    add_index :contact_messages, :status
    add_index :contact_messages, :created_at
    add_index :contact_messages, :email
    add_check_constraint :contact_messages, "status IN (0, 1, 2)", name: "contact_messages_status_check"
  end
end
