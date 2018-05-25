class ReviewsController < ApplicationController


  def new
    @vehicule = Vehicule.find(params[:vehicule_id])
    @review = Review.new
  end

  def create
    @vehicule = Vehicule.find(params[:vehicule_id])
    @reviews = Review.order(created_at: :desc).paginate(:per_page => 3, :page => params[:page])
    @review = Review.new(review_params)
    @review.vehicule = @vehicule


    if @review.save
      respond_to do |format|
        format.html { redirect_to vehicule_path(@vehicule) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'vehicules/show' }
        format.js
      end
    end
  end


  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
