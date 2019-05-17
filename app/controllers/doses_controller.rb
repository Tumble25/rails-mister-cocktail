class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.new
    @dose = Dose.new
  end

 def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # @dose.ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end



  # def new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new
#   # end
#   def create
#     @dose = Dose.new(dose_params)
#     @cocktail = Cocktail.find(params[:cocktail_id])
#     @dose.ingredient = Ingredient.find(params[:dose][:ingredient])
#     @dose.cocktail = @cocktail
#     if @dose.save
#       redirect_to cocktail_path(@cocktail)
#     else
#       render :new
#     end
#   end
#   private
#   def dose_params
#     params.require(:dose).permit(:description)
#   end
# end
