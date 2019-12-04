class PaysController < ApplicationController
  before_action :is_admin?

  def new
    @pay = Pay.new
  end

  def create
    @pay = Pay.new(pay_params)
    @pay.id = session[:id]
    if @pay.save
      redirect_to user_path(@pay.id)
    else
      render 'new'
    end
  end

  def edit
    @pay = Pay.find(session[:id])
  end

  def update
    @pay = Pay.find(session[:id])
    @pay.id = session[:id]
    @error
    if @pay.update(pay_params)
      redirect_to user_path(@pay.id)
    else
      @error
      render 'edit'
    end
  end

  private

  def pay_params
    params.require(:pay).permit(:days,:basic,:hra,:cca,:spl_all,:trans_all,:reimb,:i_tax,:p_tax,:lop,:deduction,
    :gross,:net,:ctc)
  end


  def is_admin?
    unless session[:type]=='admin'
      redirect_to root_path
    end
  end

  def per_params
    params.require(:percentage).permit(:hra,:cca,:spl_all,:trans_all)
  end

end
