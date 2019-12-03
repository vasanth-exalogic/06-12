class PaysController < ApplicationController
  before_action :is_admin?

  def new
    @pay = Pay.new
  end

  def create
    @pay = Pay.new(pay_params)
    @pay.id = session[:id]
    @pay.hra = @pay.basic * 0.05
    @pay.cca = @pay.basic * 0.05
    @pay.spl_all = @pay.basic * 0.1
    @pay.trans_all = @pay.basic * 0.05
    @pay.i_tax = @pay.basic * 0.03
    @pay.p_tax = 200
    @pay.lop = ((@pay.basic)/30)*@pay.days
    @pay.gross = @pay.basic+@pay.hra+@pay.cca+@pay.spl_all+@pay.trans_all+@pay.reimb
    @pay.net = @pay.gross-(@pay.i_tax+@pay.p_tax+@pay.lop+@pay.deduction)
    @pay.ctc = @pay.net*12
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

end
