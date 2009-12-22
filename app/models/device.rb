class Device < ActiveRecord::Base

  has_many :locations
  #validates_presence_of :device_id
  validates_format_of :push_token, 
    :with => /^[a-z0-9]{8}\s[a-z0-9]{8}\s[a-z0-9]{8}\s[a-z0-9]{8}\s[a-z0-9]{8}\s[a-z0-9]{8}\s[a-z0-9]{8}\s[a-z0-9]{8}$/

end
