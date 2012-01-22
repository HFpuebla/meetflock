class CreateCoworkerRequests < ActiveRecord::Migration
  def change
    create_table :coworker_requests do |t|
      t.references :position
      t.references :user

      t.timestamps
    end
    add_index :coworker_requests, :position_id
    add_index :coworker_requests, :user_id
  end
end
