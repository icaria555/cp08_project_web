class HardwaresController < ApplicationController
    def edit_owner
        @hardware = Hardware.find(params[:id])
        @users = User.find(@hardware.owner_id)
    end
    
    def update
        @hardware = Hardware.find(params[:id])
        @uid = params[:hardware_else][:owner_name]
        @user = User.find_by_uid(@uid)
        @hardware.update_attributes!(:owner_id => @user.id)
        redirect_to user_path
    end
    
    def new
    end
    
    def delete
    end
end