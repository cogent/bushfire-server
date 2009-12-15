require File.dirname(__FILE__) + '/../spec_helper'

describe DeviceController do

  it "have an empty response" do
    post :register_locations
    response.body.strip.should be_empty
  end

end
