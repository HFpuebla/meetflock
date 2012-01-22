class AddCityToProfiles < ActiveRecord::Migration
  def self.up 
    change_table :profiles do |t|
        t.integer :city_id
    end
      add_index :profiles, :city_id
  end
  
  def self.down
    change_table :profiles do |t|
        t.remove :city_id
    end
  end
  
end