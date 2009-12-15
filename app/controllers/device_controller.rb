class DeviceController < ActionController::Base

  def register_locations
    Device.create(params[:device])
    render :nothing => true
  end

end
