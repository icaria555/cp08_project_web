class UsersController < ApplicationController
  def index
    @users = User.all
    if(session[:user_id])
      @user = User.find_by_id(session[:user_id])
      print session[:user_id]
      redirect_to user_path(@user)
    end
  end

  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    if(@user.user_class == "Doctor")
      @userAll = User.all
      render template: "users/show_doctor"
    end
    # will render app/views/users/show.html.haml by default
    render json: @user.health.order("check_date").last if request.xhr?
  end

  def new
    @user = User.new
  end
  
  def new_relate
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
  end
  
  def create_relate
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    name = params["user"]["name"]
    name = name.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
    print "\n" + name + "\n"
    @patient = User.find_by_name(name)
    
    logic =  @patient != nil
    print "\n" + logic.to_s + "logic" + "\n"
    print @patient.name + " patient name \n"
    @relate = @user.relation.find_by_patient_id(@patient.id)
    if(@relate == nil and @patient.id != @user.id)
      @user.relation.create!(:patient_id => @patient.id)
    end
    redirect_to user_path(@user)
  end
  
  def delete_relate
    print 'enter debug'
    @user = User.find(params[:id])
    print params[:id] + "params id \n\n"
    print params[:id2] + " params id 2 \n\n"
    @relation = @user.relation.find_by_patient_id(params[:id2])
    @relation.destroy
    redirect_to user_path(@user)
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
