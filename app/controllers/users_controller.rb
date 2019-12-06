class UsersController < ApplicationController
    before_action :find_user, except: [:index, :new, :create]
    before_action :is_admin?, except: [:show]
    before_action :is_user?, only: [:show]

    def index
      @details = Detail.all
      @users = User.all
      @count = count_users(@users)
    end

    def new
      @user = User.new
      session[:temp]='new'
    end

    def create
      @error
      @user = User.new(userparams)
      if @user.role=='admin' && @user.save
        redirect_to '/users'
      elsif @user.role=='user' && @user.save
        session[:id]=@user.id
        redirect_to new_detail_path
      else
        @error="Enter valid email id and password"
        render 'new'
      end
    end

    def edit
      session[:temp]='edit'
    end

    def update
      @error
      if @user.update(userparams)
        session[:id]=@user.id
        redirect_to edit_detail_path
      else
        @error="Enter valid email id and correct password"
        render 'edit'
      end
    end

    def show
      @detail = Detail.find(params[:id])
      @emergency = Emergency.find(params[:id])
      @account = Account.find(params[:id])
    end

    def destroy
      @pay = Pay.find(params[:id])
      @detail = Detail.find(params[:id])
      @user.delete
      @pay.delete
      @detail.delete
      redirect_to '/users'
    end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def userparams
      params.require(:user).permit(:role,:email,:password,:password_confirmation)
    end

    def is_admin?
      unless session[:type]=='admin'
        redirect_to root_path
      end
    end

    def is_user?
      unless session[:id]==@user.id || session[:type]=='admin'
        redirect_to root_path
      end
    end

    def count_users(users)
      count = 0
      users.each do |user|
        unless user.role=='admin'
          count+=1
        end
      end
      count
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
