class SessionsController < ApplicationController
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_user

  def index
    print "test enter index \n"
  end


  #use for third auth
  def create
    auth=request.env["omniauth.auth"]
    user=User.find_by_uid(auth["uid"])
    session[:user_id] = user.id
    redirect_to movies_path
  end
  
  #create session for normal user
  def createSess
    auth= params[:user]
    user=User.find_by_uid(auth["uid"])
    session[:user_id] = user.id
    redirect_to movies_path
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to movies_path
  end

  def failure
    redirect_to login_path
  end
  
  def recieve
    print "start test \n"

    id = params[":uid"]
    @user = User.find_by_uid(id)
    print "test bug params health \n"
    data = params[":spo2"].to_i,params[":h_rate"].to_i
    @health_data = @user.health.create!(:spo2 => data[0],:h_rate => data[1], :h_signal => params[":h_signal"])
    print "end \n"
    render nothing: true
    
  end
end


