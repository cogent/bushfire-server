require File.dirname(__FILE__) + '/../spec_helper'

describe DeviceController do

  SAMPLE_DEVICE_ID = "my_device"
  SAMPLE_PUSH_TOKEN = "65223c62 60fa4e32 76649dd1 60e8d571 73946ec6 1516f854 0ec50d27 c89897f9"

  it "have an empty response" do
    post :register_locations, :device => { "device_id" => SAMPLE_DEVICE_ID, "push_token" => SAMPLE_PUSH_TOKEN }
    response.should be_success
    response.body.strip.should be_empty
  end

  describe "a new device" do

    it "should create a device" do
      Device.should_receive(:create).with("device_id" => SAMPLE_DEVICE_ID, "push_token" => SAMPLE_PUSH_TOKEN)

      post :register_locations, :device => { "device_id" => SAMPLE_DEVICE_ID, "push_token" => SAMPLE_PUSH_TOKEN }
      response.should be_success
    end

    it "should create locations"

  end

  describe "an existing device" do

    it "should set the push_token" do
      device = mock("device")
      Device.should_receive(:find_by_device_id).with(SAMPLE_DEVICE_ID).and_return(device)
      device.should_receive(:update_attributes).with(:push_token => SAMPLE_PUSH_TOKEN)

      post :register_locations, :device => { "device_id" => SAMPLE_DEVICE_ID, "push_token" => SAMPLE_PUSH_TOKEN }
      response.should be_success
    end

    it "should change the set of locations"

  end

end
