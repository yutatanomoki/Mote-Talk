class Instructor::ReviewsController < ApplicationController
  def index
    @ramen_shop = RamenShop.find(params[:ramen_shop_id])
    @reviews = @ramen_shop.reviews
  end
end
