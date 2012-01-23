class SharesController < ApplicationController
  def show 
    @share = Share.find(params[:id])
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
end
