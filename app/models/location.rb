class Location < ActiveRecord::Base

  belongs_to :device
  before_validation_on_create :apply_defaults

  validates_numericality_of :latitude, :greater_than => -90, :less_than_or_equal_to => 90
  validates_numericality_of :longitude, :greater_than => -180, :less_than_or_equal_to => 180
  validates_numericality_of :notifcation_radius, :greater_than => 0

  private
    def apply_defaults
      self.notifcation_radius ||= 50
    end

end
