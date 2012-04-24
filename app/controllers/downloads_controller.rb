class DownloadsController < ApplicationController
  def download
    upload = Upload.find_by_shortcut(params[:download_id])
    unless upload.nil?
      send_file upload.file.to_s
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
