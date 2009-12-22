class DeviceController < ActionController::Base

  def register_locations
    Device.find_or_create_by_device_id(params[:device])
    render :nothing => true
  end

end
