class UploadsController < ApplicationController
  def create
    @share = Share.find(params[:share_id])
    @upload = @share.uploads.build(params[:upload])
    if @upload.save
      redirect_to share_path(params[:share_id])
    else
      render share_path(params[:share_id])
    end
  end
end
