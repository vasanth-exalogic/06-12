class PersController < ApplicationController
  before_action :is_admin?

  def edit
    @per = Per.find(1)
  end

  def update
    @per = Per.find(1)
    if @per.update(per_params)
      redirect_to '/users'
    else
      render 'edit'
    end
  end

  private

  def per_params
    params.require(:per).permit(:hra_per,:cca_per,:spl_all_per,:trans_all_per)
  end

  def is_admin?
    unless session[:type] == 'admin'
      redirect_to root_path
    end
  end
end
