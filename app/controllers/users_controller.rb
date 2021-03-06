class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :admin_only, :except => :show

  #def index
   # @users = User.all
  #end
  
  def show
      @user = User.find(params[:id])
      unless current_user.admin?
        unless @user == current_user
          redirect_to :back, :alert => "لا يمكن الدخول لهذه الصفحة"
        end
      end
    end
    
    def edit 
      @user = User.find(params[:id])
    end 

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(secure_params)
        redirect_to users_path, :notice => "تم تحديث المستخدم"
      else
        redirect_to users_path, :alert => "لا يمكن تحديث المستخدم"
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to users_path, :notice => "تم مسح المستخدم"
    end

    private

    def admin_only
      unless current_user.admin?
        redirect_to :back, :alert => "لا يمكن الدخول لهذه الصفحة"
      end
    end

    def secure_params
      params.require(:user).permit(:role)
    end

end
