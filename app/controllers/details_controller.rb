class DetailsController < ApplicationController
  before_action :is_admin?

  def new
    @detail = Detail.new
    session[:temp]='new'
  end

  def create
    @error
    @detail = Detail.new(detail_params)
    @detail.id = session[:id]
    @detail.empid = ("EXA" << (session[:id].to_s).rjust(4,"0"))
    if @detail.save
      redirect_to new_emergency_path
    else
      @error = "Please fill the mandatory fields"
      render 'new'
    end
  end

  def edit
    @detail = Detail.find(session[:id])
    session[:temp]='edit'
  end

  def update
    @detail = Detail.find(session[:id])
    @error
    if @detail.update(detail_params)
      redirect_to edit_emergency_path
    else
      @error = "Please fill all the mandatory fields"
      render 'edit'
    end
  end

  private

  def detail_params
    params.require(:detail).permit(:fname,:lname,:dob,:doj,:sal,:contact,:bloodtype,:address,:city,:state,:gender,:notice,
    :country,:pincode)
  end

  def is_admin?
    unless session[:type]=='admin'
      redirect_to root_path
    end
  end
end
