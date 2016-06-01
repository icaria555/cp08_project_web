class SessionsController < ApplicationController
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_user
  @@limit_health_size = 50 #limit health model size
  
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
    print "\n\n\n\n\n start test \n"

    id = params[":uid"]
    @user = User.find_by_uid(id)
    @health_data = @user.health
    
    print "test bug params health \n"
    data = params[":spo2"].to_i,params[":h_rate"].to_i
    print "user'health length = #{@user.health.length}\n"
    print "\n\n\n\n\n #{params[":check_date"]} \n\n\n\n\n"
    @checkDate = @user.health.find_by_check_date(params[":check_date"])
    if(@checkDate != nil)
      print "\n\n\n\n\n if \n\n\n\n\n"
      @health_data.update(
        @checkDate.id,
        :spo2 => data[0],
        :h_rate => data[1], 
        :h_signal => params[":h_signal"],
        :check_date => params[":check_date"]
      )
    elsif(@user.health.length <= @@limit_health_size )
      print "\n\n\n\n\n elsif \n\n\n\n\n"
      @health_data = @user.health.create!(
        :spo2 => data[0],
        :h_rate => data[1], 
        :h_signal => params[":h_signal"],
        :check_date => params[":check_date"]
      )
    else
      print "\n\n\n\n\n else \n\n\n\n\n"
      print "\n\n\n\n\n" ,@user.health.order("check_date").last.check_date , params[":check_date"],"before update\n\n\n\n\n"
      @health_data.update(
        @user.health.order("check_date").last.id,
        :spo2 => data[0],
        :h_rate => data[1], 
        :h_signal => params[":h_signal"],
        :check_date => params[":check_date"]
      )
      print @user.health.order("check_date").last.check_date , "   after update \n"
    end
    
    print @checkDate == nil
    print "end \n\n\n\n\n"
    render nothing: true
    
  end
end