class InitialModels < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.string :device_id, :push_token
      t.timestamps
    end

    create_table :locations do |t|
      t.column "latitude", :decimal, :precision => 15, :scale => 10
      t.column "longitude", :decimal, :precision => 15, :scale => 10
      t.integer :device_id, :null => false, :on_delete => :cascade
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
    drop_table :devices
  end
end
