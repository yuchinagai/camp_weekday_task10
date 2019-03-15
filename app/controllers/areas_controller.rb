class AreasController < ApplicationController
  include Address
  def index
    @area = Area.all
  end

  def show
    @area = Area.find(params[:id])
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    post_api
  end

  def update
    @area = Area.new(area_params)
    if @area.save
      flash[:notice] = '地域を登録しました。'
      redirect_to root_path
    else
      flash.now[:alert] = "Validation failed: #{@area.errors.full_messages.join}"
      render action: :edit
    end
  end

  private

  def area_params
    params.require(:area).permit(:zipcode, :prefcode, :address1, :address2, :address3, :kana1, :kana2, :kana3, :introduction)
  end

  def set_post
    @area = Area.find(params[:id])
  end
end
