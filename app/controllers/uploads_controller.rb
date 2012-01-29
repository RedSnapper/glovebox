class UploadsController < ApplicationController

  before_filter :get_share
  before_filter :authenticate_admin_or_access_key!
  
  def create
    @upload = @share.uploads.build(params[:upload])
    if !@upload.save
      flash[:error] = 'File upload failed'
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @upload = @share.uploads.find(params[:id])
    @upload.destroy
    
    respond_to do |format|
      format.js
      format.html do
        redirect_to share_path(params[:share_id])
      end
    end
  end

  private

  def get_share
    @share = Share.find(params[:share_id])
  end

  def authenticate_admin_or_access_key!
    unless @share.check_access_key(params[:access_key])
      authenticate_admin!
    end
  end
end
