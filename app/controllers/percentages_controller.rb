class PercentagesController < ApplicationController

  def edit
    @percentage = Percentage.find(1)
  end

  def update
    @percentage = Percentage.find(1)
    if @percentage.update(per_params)
      redirect_to '/users'
    else
      render 'edit'
    end
  end

  def per_params
    params.require(:percentage).permit(:hra,:cca,:spl_all,:trans_all)
  end
end
