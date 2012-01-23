class SharesController < ApplicationController
  def show 
    @share = Share.find(params[:id])
  end

  def new
    @share = Share.new
  end
end
