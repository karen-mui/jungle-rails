require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'is valid' do
      user = User.new({
        "first_name" => "Test",
        "last_name" => "Exam",
        "email" => "email@email.com",
        "password" => "123pw",
        "password_confirmation" => "123pw"
      })
      expect(user).to be_valid
    end

    xit 'is created with a matching password and password_confirmation' do
      @user = User.new({
        "name" => "Test",
        "email" => "email@email.com",
        "password" => "123pw",
        "password_confirmation" => "123pw"
      })
      @user.save
      expect(@user).to be_valid

      @user = User.new({
        "name" => "Test",
        "email" => "email@email.com",
        "password" => "123",
        "password_confirmation" => "123pw"
      })
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    xit 'is created with a unique email' do
      @user = User.new({
        "name" => "Test",
        "email" => "email@email.com",
        "password" => "123pw",
        "password_confirmation" => "123pw"
      })
      @user.save
      @user1 = User.new({
        "name" => "Exam",
        "email" => "email@email.com",
        "password" => "abc123",
        "password_confirmation" => "abc123"
      })
      @user1.save
      expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages).to include("")
    end

    xit 'has email' do
      @user = User.new({
        "name" => "Test",
        "email" => nil,
        "password" => "abc123",
        "password_confirmation" => "abc123"
      })
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    xit 'has first name' do
      @user = User.new({
        "first name" => "Test",
        "last name" => "Exam",
        "email" => "email@email.com",
        "password" => "abc123",
        "password_confirmation" => "abc123"
      })
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'has last name' do



    end

    it 'has a password of minimum length' do
    end

  end

end
