class ProductsController < RankingController
  def index
    @products = Product.order('created_at').limit(20)
  end

  def show
    @product = Product.find(params[:id])
  end
end
