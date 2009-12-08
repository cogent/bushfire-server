class Incident < ActiveRecord::Base

  before_validation_on_create :apply_defaults

  validates_numericality_of :latitude, :greater_than => -90, :less_than_or_equal_to => 90
  validates_numericality_of :longitude, :greater_than => -180, :less_than_or_equal_to => 180
  validates_numericality_of :severity, :greater_than_equal_to => 0

  private
    def apply_defaults
      self.status ||= "SAFE"
      self.severity ||= 0
    end
  
end
