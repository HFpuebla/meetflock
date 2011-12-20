class AddExtraColumnsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name
      t.text :motto
      t.string :website
      t.string :status
      t.boolean :receive_newsletter
      t.references :location
    end
  end
end