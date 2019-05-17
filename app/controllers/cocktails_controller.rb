class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
    # @dose = Dose.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:dose_id]
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    # @cocktail.dose = Dose.find(params[:cocktail])
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
