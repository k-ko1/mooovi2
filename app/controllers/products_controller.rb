class ProductsController < RankingController
  before_action :authenticate_user!, only: :search

  def index
    @products = Product.order('created_at').limit(20)
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews.order('created_at DESC')
  end

  def search
    @search_products = Product.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end
end
