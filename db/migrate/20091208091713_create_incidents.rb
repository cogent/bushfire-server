class CreateIncidents < ActiveRecord::Migration
  def self.up
    create_table :incidents do |t|
      t.string :status
      t.column "latitude", :decimal, :precision => 15, :scale => 10
      t.column "longitude", :decimal, :precision => 15, :scale => 10
      t.integer :severity
      t.timestamps
    end
  end

  def self.down
    drop_table :incidents
  end
end
