class PercentagesController < ApplicationController
  before_action :is_admin?

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

  private

  def per_params
    params.require(:percentage).permit(:hra,:cca,:spl_all,:trans_all)
  end

  def is_admin?
    unless session[:type] == 'admin'
      redirect_to root_path
    end
  end
  
end
