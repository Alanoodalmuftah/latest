module ApplicationHelper
  def human_boolean(boolean)
      boolean ? 'نعم' : 'لا'
  end
  
  def one_user_registered?
    if ((User.count == 1) & (user_signed_in?))
    redirect_to root_path
    if User.count == 1
      redirect_to new_user_session_path
    end  
  end
end
end
