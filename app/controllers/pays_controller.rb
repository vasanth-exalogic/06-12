class PaysController < ApplicationController
  before_action :is_admin?
    @@cca_percentage
    @@hra_percentage
    @@trans_all_percentage
    @@spl_all_percentage
  def index
  end

  def save
    @@hra_percentage = params[:hra].to_d/100
    @@cca_percentage = params[:cca].to_d/100
    @@spl_all_percentage = params[:spl].to_d/100
    @@trans_all_percentage = params[:trans].to_d/100
    redirect_to '/users'
  end

  def new
    @pay = Pay.new
  end

  def create
    @pay = Pay.new(pay_params)
    @pay.id = session[:id]
    @pay.hra = @pay.basic * @@hra_percentage
    @pay.cca = @pay.basic * @@cca_percentage
    @pay.spl_all = @pay.basic * @@spl_all_percentage
    @pay.trans_all = @pay.basic * @@trans_all_percentage
    @pay.lop = ((@pay.basic)/30)*@pay.days
    @pay.gross = @pay.basic+@pay.hra+@pay.cca+@pay.spl_all+@pay.trans_all+@pay.reimb
    @pay.net = @pay.gross-(@pay.lop+@pay.deduction)
    @pay.ctc = @pay.net*12
    @pay.i_tax = find_i_tax(@pay.ctc)
    @pay.p_tax = find_p_tax(@pay.net)
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
    @pay.hra = @pay.basic * @@hra_percentage
    @pay.cca = @pay.basic * @@cca_percentage
    @pay.spl_all = @pay.basic * @@spl_all_percentage
    @pay.trans_all = @pay.basic * @@trans_all_percentage
    @pay.lop = ((@pay.basic)/30)*@pay.days
    @pay.gross = @pay.basic+@pay.hra+@pay.cca+@pay.spl_all+@pay.trans_all+@pay.reimb
    @pay.net = @pay.gross-(@pay.lop+@pay.deduction)
    @pay.ctc = @pay.net*12
    @pay.i_tax = find_i_tax(@pay.ctc)
    @pay.p_tax = find_p_tax(@pay.net)
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

  def find_i_tax(ctc)
    if ctc <= 250000
      return 0
    elsif ctc <= 500000
      return (ctc-250000)*0.05
    elsif ctc <= 1000000
      return 12500+((ctc-500000)*0.2)
    else
      return 112500+((ctc-1000000)*0.3)
    end
  end

  def find_p_tax(net)
    if net <= 15000
      return 0
    else
      return 200
    end
  end

end
