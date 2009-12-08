class RenameNotificationRadiusColumn < ActiveRecord::Migration
  def self.up
    rename_column(:locations, :notifcation_radius, :notification_radius)
  end

  def self.down
    rename_column(:locations, :notification_radius, :notifcation_radius)
  end
end
