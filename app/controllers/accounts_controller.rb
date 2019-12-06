class AccountsController < ApplicationController
  before_action :is_admin?

  def new
    @account = Account.new
    session[:temp]='new'
  end

  def create
    @error
    @account = Account.new(account_params)
    @account.id = session[:id]
    if @account.save
      session[:id] = @account.id
      redirect_to user_path(@account)
    else
      @error = "Please fill all the mandatory fields"
      render 'new'
    end
  end

  def edit
    @account = Account.find(session[:id])
    session[:temp]='edit'
  end

  def update
    @account = Account.find(session[:id])
    @error
    if @account.update(account_params)
      session[:id] = @account.id
      redirect_to user_path(@account)
    else
      @error = "Please fill all the mandatory fields"
      render 'edit'
    end
  end

  private

  def account_params
    params.require(:account).permit(:accno,:bank,:branch,:ifsc,:accname)
  end

  def is_admin?
    unless session[:type]=='admin'
      redirect_to root_path
    end
  end
end
