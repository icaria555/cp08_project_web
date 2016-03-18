class SessionsController < ApplicationController
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_user

  def index
    print "test enter index \n"
  end


  #use for third auth
  def create
    auth=request.env["omniauth.auth"]
    user=Moviegoer.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
      Moviegoer.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to movies_path
  end
  
  #create session for normal user
  def createSess
    user = params[":id"] 
    
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to movies_path
  end

  def failure
    redirect_to login_path
  end
  
  def tester
    print "start test \n"
    print params[":id"]
    print "\n"
    render nothing: true
    
  end
end


