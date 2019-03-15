class AreasController < ApplicationController
  include Address
  before_action :set_post, only: [:show, :update]
  def index
    @area = Area.all
  end

  def show
  end

  def new
    @area = Area.new
    post_api
  end

  def create
    @area = Area.new(area_params)
    post_api
    render action: :edit
  end

  def update
    @area.update(area_params)
    @area.save
    redirect_to "http://localhost:3000/"
  end

  private

  def area_params
    params.require(:area).permit(:zipcode, :prefcode, :address1, :address2, :address3, :kana1, :kana2, :kana3, :introduction)
  end

  def set_post
    @area = Area.find(params[:id])
  end
end
