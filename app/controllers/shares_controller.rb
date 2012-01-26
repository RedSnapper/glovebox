class SharesController < ApplicationController

  before_filter :authenticate_admin!

  def index
    @shares = Share.all
  end

  def show 
    @share = Share.find(params[:id])
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
    @share = Share.find(params[:id])
  end

  def update
    @share = Share.find(params[:id])
    if @share.update_attributes(params[:share])
      flash[:success] = "Share updated"
      redirect_to :share
    else
      flash[:error] = "Share update failed"
      render :edit
    end
  end

  def destroy
    Share.find(params[:id]).destroy
    flash[:success] = "Share deleted"
    redirect_to shares_path
  end
end
