class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.string :full_name, null: false
      t.string :headline
      t.text :bio
      t.string :availability_text
      t.string :cv_url
      t.string :avatar_url

      t.timestamps
    end
  end
end
