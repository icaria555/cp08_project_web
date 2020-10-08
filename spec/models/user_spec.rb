require "rails_helper"

RSpec.describe User,  :type => :model do
    let(:user) {
        User.new(
            name:'Test Tester',
            uid:'Tester001',
            password:'123456',
            user_class:'Admin'
        )
    }
    
    describe "Validations" do
        it "is valid when object have userId, password and user_class at least" do
            expect(user).to be_valid
        end
        
        it "capitalize name after save" do
            user.name = 'test tester'
            user.save!
            
            check_user = User.find_by_uid('Tester001')
            expect(check_user.name).to eq('Test Tester')
        end
        
        it "is invalid without name" do
            user.name = nil
            expect(user).to_not be_valid
        end
        
        it "is invalid without uid" do
            user.uid = nil
            expect(user).to_not be_valid
        end
        
        it "is invalid without password" do
            user.password = nil
            expect(user).to_not be_valid
        end
        
        it "is invalid without user class" do
            user.user_class = nil
            expect(user).to_not be_valid
        end
        
        it "is invalid without name length more than 30" do
            user.name = 'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt\
            ttttttttttttttttttttttttttttttttttttteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\
            sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss\
            tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt'
            expect(user).to_not be_valid
        end
        
        it "is invalid without uid length more than 30" do
            user.uid = 'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt\
            ttttttttttttttttttttttttttttttttttttteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\
            sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss\
            tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt'
            expect(user).to_not be_valid
        end
    end
end