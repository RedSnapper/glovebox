class UploadsController < ApplicationController
  def create
    @share = Share.find(params[:share_id])
    @upload = @share.uploads.build(params[:upload])
    if !@upload.save
      flash[:error] = 'File upload failed'
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @share = Share.find(params[:share_id])
    @upload = @share.uploads.find(params[:id])
    @upload.destroy
    
    respond_to do |format|
      format.js
      format.html do
        redirect_to share_path(params[:share_id])
      end
    end
  end
end
