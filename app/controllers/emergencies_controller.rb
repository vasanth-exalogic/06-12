class EmergenciesController < ApplicationController
  before_action :is_admin?

  def new
    @emergency = Emergency.new
    session[:temp]='new'
  end

  def create
    @error
    @emergency = Emergency.new(emergency_params)
    @emergency.id = session[:id]
    if @emergency.save
      redirect_to new_pay_path
    else
      @error = "Please fill all the mandatory fields"
      render 'new'
    end
  end

  def edit
    @emergency = Emergency.find(session[:id])
    session[:temp]='edit'
  end

  def update
    @emergency = Emergency.find(session[:id])
    @error
    if @emergency.update(emergency_params)
      redirect_to edit_pay_path
    else
      @error = "Please fill all the mandatory fields"
      render 'edit'
    end
  end

  private

  def emergency_params
    params.require(:emergency).permit(:ename,:relation,:econtact,:pskill,:sskill1,:sskill2)
  end

  def is_admin?
    unless session[:type]=='admin'
      redirect_to root_path
    end
  end
end
