class SharesController < ApplicationController

  before_filter :get_share, :except => [:index, :new, :create]
  before_filter :authenticate_admin!, :except => [:show, :view]
  before_filter :authenticate_admin_or_access_key!, :only => :show
  before_filter :authenticate_admin_or_view_key!, :only => :view

  def index
    @shares = Share.all
  end

  def show 
    @upload = @share.uploads.new
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.new(params[:share])
    if @share.save
      flash[:success] = "Box created"
      redirect_to @share
    else
      flash[:error] = "Box creation failed"
      render :new
    end
  end

  def edit
  end

  def update
    if @share.update_attributes(params[:share])
      flash[:success] = "Box updated"
      redirect_to :share
    else
      flash[:error] = "Box update failed"
      render :edit
    end
  end

  def destroy
    @share.destroy
    flash[:success] = "Box deleted"
    redirect_to shares_path
  end

  #View files uploaded to a share without upload/delete controls
  def view
  end

  private

  def get_share
    @share = Share.find(params[:id])
  end

  def authenticate_admin_or_access_key!
    unless @share.check_access_key(params[:access_key])
      authenticate_admin!
    end
  end

  def authenticate_admin_or_view_key!
    unless @share.check_view_key(params[:view_key])
      authenticate_admin!
    end
  end
end
