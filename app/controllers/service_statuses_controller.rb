class ServiceStatusesController < ApplicationController
  def new
	@service_status = ServiceStatus.new
  end
end
