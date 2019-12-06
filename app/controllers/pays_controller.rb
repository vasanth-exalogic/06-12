class PaysController < ApplicationController
  before_action :is_admin?

  def new
    @detail = Detail.find(params[:id])
    session[:id]=@detail.empid
    @year = find_year(@detail.doj)
    @pay = Pay.new
  end

  def create
    @pay = Pay.new(pay_params)
    @per = Per.find(1)
    @pay.basic ||= 0
    @pay.hra = @pay.basic*@per.hra_per
    @pay.cca = @pay.basic*@per.cca_per
    @pay.spl_all = @pay.basic*@per.spl_all_per
    @pay.trans_all = @pay.basic*@per.trans_all_per
    @pay.gross = @pay.hra+@pay.cca+@pay.spl_all+@pay.trans_all
    @pay.lop = (@pay.gross/30)*@pay.days
    @pay.deduction ||= 0
    @pay.net = @pay.gross-(@pay.lop+@pay.deduction)
    @pay.p_tax = find_ptax(@pay.gross)
    @pay.ctc = @pay.gross*12
    @pay.id = session[:id] << (@pay.month.to_s.rjust(2,"0")) << (@pay.year.to_s)
    if @pay.save
      redirect_to "/users"
    else
      render "new"
    end
  end

  def show
    @pay = Pay.find(params[:id])
  end

  private

  def pay_params
    params.require(:pay).permit(:pay_id,:month,:year,:days,:basic,:hra,:cca,:spl_all,:trans_all,:reimb,:i_tax,:p_tax,:lop,:deduction,
    :gross,:net,:ctc,:hra_per,:cca_per,:spl_all_per,:trans_all_per)
  end


  def is_admin?
    unless session[:type]=='admin'
      redirect_to root_path
    end
  end

  def find_year(date)
    date.strftime("%Y")
  end

  def find_ptax(sal)
    if sal>=15000
      200
    else
      0
    end
  end
end
