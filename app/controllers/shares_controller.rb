class SharesController < ApplicationController

  before_filter :get_share, :except => [:index, :new, :create]
  before_filter :authenticate_admin!, :except => :show
  before_filter :authenticate_admin_or_access_key!, :only => :show

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
      flash[:success] = "Share created"
      redirect_to @share
    else
      flash[:error] = "Share creation failed"
      render :new
    end
  end

  def edit
  end

  def update
    if @share.update_attributes(params[:share])
      flash[:success] = "Share updated"
      redirect_to :share
    else
      flash[:error] = "Share update failed"
      render :edit
    end
  end

  def destroy
    @share.destroy
    flash[:success] = "Share deleted"
    redirect_to shares_path
  end

  private

  def get_share
    @share = Share.find(params[:id])
  end

  def authenticate_admin_or_access_key!
    if params[:access_key] != @share.access_key
      authenticate_admin!
    end
  end
end
