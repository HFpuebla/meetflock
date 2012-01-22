class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :motto
      t.string :website
      t.string :status
      t.boolean :receive_newsletter
      t.boolean :published
      t.references :position
      t.references :user

      t.timestamps
    end
    add_index :profiles, :user_id
    add_index :profiles, :position_id
  end
end
