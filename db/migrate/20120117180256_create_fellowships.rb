class CreateFellowships < ActiveRecord::Migration
  def change
    create_table :fellowships do |t|
      t.integer :user_id
      t.integer :coworker_id
      t.integer :status
      t.timestamps
    end
  end
end
