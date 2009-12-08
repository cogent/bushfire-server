require File.dirname(__FILE__) + '/../spec_helper'

describe Location do

  before(:each) do
    @location = Location.new(:device => devices(:kevin))
    @location.latitude = -38
    @location.longitude = 132
  end

  describe "when creating" do
    it "should set created_at to now" do
      @location.should_receive(:created_at)
      @location.save
    end

    it "should default notification radius to 50" do
      @location.save
      @location.notifcation_radius.should == 50
    end
  end

  describe "when setting" do

    describe "latitude" do
      it "should not accept a value greater than 90" do
        @location.latitude = 91
        @location.should_not be_valid
      end
      it "should not accept a value less than -90" do
        @location.latitude = -91
        @location.should_not be_valid
      end
      it "should accept a zero" do
        @location.latitude = 0
        @location.should be_valid
      end
      it "should accept a positive number" do
        @location.latitude = 33
        @location.should be_valid
      end
      it "should accept a negative number" do
        @location.latitude = -68
        @location.should be_valid
      end
    end

    describe "longitude" do
      it "should not accept a value greater than 180" do
        @location.longitude = 181
        @location.should_not be_valid
      end
      it "should not accept a value less than -180" do
        @location.longitude = -181
        @location.should_not be_valid
      end
      it "should accept a zero" do
        @location.longitude = 0
        @location.should be_valid
      end
      it "should accept a positive number" do
        @location.longitude = 133
        @location.should be_valid
      end
      it "should accept a negative number" do
        @location.longitude = -8
        @location.should be_valid
      end
    end
    
    describe "notifcation_radius" do
      it "should not accept a negative number" do
        @location.notifcation_radius = -10
        @location.should_not be_valid
      end
      it "should not accept zero" do
        @location.notifcation_radius = 0
        @location.should_not be_valid
      end
      it "should accept a valid number" do
        @location.notifcation_radius = 10
        @location.should be_valid
      end
    end

  end

end
