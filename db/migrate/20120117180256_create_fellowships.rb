class CreateFellowships < ActiveRecord::Migration
  def change
    create_table :fellowships do |t|
      t.integer :inviter_id
      t.integer :invited_id
      t.integer :statu, :default => 0 
      t.timestamps
    end
  end
end
