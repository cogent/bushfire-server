require File.dirname(__FILE__) + '/../spec_helper'

describe Incident do

  before(:each) do
    @incident = Incident.new
    @incident.latitude = -38
    @incident.longitude = 132
  end

  describe "when creating" do
    it "should set created_at to now" do
      @incident.should_receive(:created_at)
      @incident.save
    end
    it "should set severity to zero" do
      @incident.save
      @incident.severity.should == 0
    end
    it "should set status to safe" do
      @incident.save
      @incident.status.should == "SAFE"
    end
  end

  describe "when setting" do

    describe "latitude" do
      it "should not accept a value greater than 90" do
        @incident.latitude = 91
        @incident.should_not be_valid
      end
      it "should not accept a value less than -90" do
        @incident.latitude = -91
        @incident.should_not be_valid
      end
      it "should accept a zero" do
        @incident.latitude = 0
        @incident.should be_valid
      end
      it "should accept a positive number" do
        @incident.latitude = 33
        @incident.should be_valid
      end
      it "should accept a negative number" do
        @incident.latitude = -68
        @incident.should be_valid
      end
    end

    describe "longitude" do
      it "should not accept a value greater than 180" do
        @incident.longitude = 181
        @incident.should_not be_valid
      end
      it "should not accept a value less than -180" do
        @incident.longitude = -181
        @incident.should_not be_valid
      end
      it "should accept a zero" do
        @incident.longitude = 0
        @incident.should be_valid
      end
      it "should accept a positive number" do
        @incident.longitude = 133
        @incident.should be_valid
      end
      it "should accept a negative number" do
        @incident.longitude = -8
        @incident.should be_valid
      end
    end
  end

end
