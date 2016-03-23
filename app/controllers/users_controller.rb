class UsersController < ApplicationController
  def index
    @users = User.all
    print "test bug index method"
  end

  def show
    id = params[:id] # retrieve user ID from URI route

    @user = User.find(id) # look up user by unique ID
    # will render app/views/users/show.html.haml by default
    print @user.health
  end

  def new
    @user = User.new
  end
  
  def tester
    print 'enter debug'
  end

  #create user for stream data, user should have unique name, id
  def create

    params[:user][:name] = 
    params[:user][:name] + " " + params[:user_sur][:surname]
    @user = User.create!(params[:user])
    if @user.valid?
      flash[:notice] = "#{@user.name} was successfully created."
      redirect_to users_path
    else
      flash[:notice] = @user.errors.messages[:name]
      @user.destroy
      redirect_to new_user_path
    end
    
  end
# in users_controller.rb
 
  def edit
    @user = User.find params[:id]
  end
 
  def update
    if params.key?('cancel') 
      #redirect_to users_path
    else
      @user = User.find params[:id]
      @user.update_attributes!(params[:user])
      flash[:notice] = "#{@user.title} was successfully updated."
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "user '#{@user.name}' deleted."
    redirect_to users_path
  end

  def login
    true
  end
end
