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

  def destroy
    share = Share.find(params[:share_id])
    upload = share.uploads.find(params[:id])
    upload.destroy

    redirect_to share_path(params[:share_id])
  end
end
