require File.dirname(__FILE__) + '/../spec_helper'

describe Device do

  before(:each) do
    @device = Device.new
    @device.push_token = "65223c62 60fa4e32 76649dd1 60e8d571 73946ec6 1516f854 0ec50d27 c89897f9"
  end

  describe "when creating" do
    it "should set created_at to now" do
      @device.should_receive(:created_at)
      @device.save
    end
  end

  describe "when setting push token" do
    it "should accept a valid token" do
      @device.push_token = "65223c62 60fa4e32 76649dd1 60e8d571 73946ec6 1516f854 0ec50d27 c89897f9"
      @device.should be_valid
    end

    it "should not accept an empty token" do
      @device.push_token = ""
      @device.should_not be_valid
    end

    it "should not accept a short token" do
      @device.push_token = "65223c62 60fa4e32 76649dd1 60e8d571 73946ec6 1516f854 0ec50d27 c89897f"
      @device.should_not be_valid
    end

    it "should not accept a unformated token" do
      @device.push_token = "65223c6260fa4e3276649dd160e8d57173946ec61516f8540ec50d27c89897f"
      @device.should_not be_valid
    end

    it "should not accept a token with invalid chars" do
      @device.push_token = "65223c6# 60fa4e32 76649dd1 60e8d571 73946ec6 1516f854 0ec50d27 c89897f9"
      @device.should_not be_valid
      @device.push_token = "65223c62 $0fa4e32 76649dd1 60e8d571 73946ec6 1516f854 0ec50d27 c89897f9"
      @device.should_not be_valid
      @device.push_token = "65223c62 60fa4e32 76649dd1 60e8d571 73946ec6 1516f854 0ec50d27 c89897f."
      @device.should_not be_valid
      @device.push_token = ",5223c62 60fa4e32 76649dd1 60e8d571 73946ec6 1516f854 0ec50d27 c89897f9"
      @device.should_not be_valid
    end
  end

end
