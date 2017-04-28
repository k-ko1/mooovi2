class ReviewsController < RankingController
  before_action :authenticate_user!, only: :new

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    Review.create(review_params)
    redirect_to products_path
  end

  private
  def review_params
    params.require(:review).permit(:nickname, :rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end
