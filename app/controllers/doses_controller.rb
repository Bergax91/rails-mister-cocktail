class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

   def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end


# def create
#     @review = Review.new(review_params)
#     # we need `restaurant_id` to associate review with corresponding restaurant
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     @review.restaurant = @restaurant
#     @review.save
#     redirect_to restaurant_path(@restaurant)
#   end

#   private

#   def review_params
#     params.require(:review).permit(:content)
#   end
# end
