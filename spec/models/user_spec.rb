require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    before(:each) do
      @user = User.new
    end

    it "should succcesfully create a user when all fields are entered correctly" do
      @user.first_name = "Test"
      @user.last_name = "User"
      @user.email = "testuser@gmail.com"
      @user.password = "123456789"
      @user.password_confirmation = "123456789"

      @user.save!
    end

    it "user must be created with a password and password_confirmation" do
      @user.first_name = "Test"
      @user.last_name = "User"
      @user.email = "testuser@gmail.com"
      @user.password = nil
      @user.password_confirmation = nil

      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "has a password and password_confirmation that match" do
      @user.first_name = "Test"
      @user.last_name = "User"
      @user.email = "testuser@gmail.com"
      @user.password = "123456789"
      @user.password_confirmation = "123456788"

      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      
    end

    it "must use an email that does not already exist in the database" do
      @testuser = User.new
      @testuser.first_name = "First"
      @testuser.last_name = "Test"
      @testuser.email = "testuser@gmail.com"
      @testuser.password = "123456788"
      @testuser.password_confirmation = "123456788"

      @testuser.save

      @user.first_name = "Test"
      @user.last_name = "User"
      @user.email = "testuser@gmail.com"
      @user.password = "123456789"
      @user.password_confirmation = "123456789"
      
      @user.save
      expect(@user.errors.full_messages).to include("Email has already been taken")
      
    end

    it "should have an email, first name and last name" do
      @user.first_name = nil
      @user.last_name = nil
      @user.email = nil
      @user.password = "123456789"
      @user.password_confirmation = "123456789"

      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should have a minimum length for a password" do
      @user.first_name = "Test"
      @user.last_name = "User"
      @user.email = "testuser@gmail.com"
      @user.password = "123"
      @user.password_confirmation = "123"

      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
  end
end
