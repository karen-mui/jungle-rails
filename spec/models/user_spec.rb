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

    it 'is created with a matching password and password_confirmation' do
      user = User.new({
        "first_name" => "Test",
        "last_name" => "Exam",
        "email" => "email@email.com",
        "password" => "123",
        "password_confirmation" => "123pw"
      })
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it 'is created with a unique email' do
      user1 = User.new({
        "first_name" => "Test",
        "last_name" => "Exam",
        "email" => "email@email.com",
        "password" => "123pw",
        "password_confirmation" => "123pw"
      })
      user1.save
      user2 = User.new({
        "first_name" => "Test",
        "last_name" => "Exam",
        "email" => "email@email.com",
        "password" => "abc123",
        "password_confirmation" => "abc123"
      })
      user2.save
      expect(user2).to be_invalid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'requires email' do
      user = User.new({
        "first_name" => "Test",
        "last_name" => "Exam",
        "email" => nil,
        "password" => "abc123",
        "password_confirmation" => "abc123"
      })
      user.save
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Email can't be blank")

      user.email = "email@email.com"
      expect(user).to be_valid
    end

    it 'requires first name' do
      user = User.new({
        "first_name" => nil,
        "last_name" => "Exam",
        "email" => "email@email.com",
        "password" => "abc123",
        "password_confirmation" => "abc123"
      })
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("First name can't be blank")

      user.first_name = "Test"
      expect(user).to be_valid
    end

    it 'requires last name' do
      user = User.new({
        "first_name" => "Test",
        "last_name" => nil,
        "email" => "email@email.com",
        "password" => "abc123",
        "password_confirmation" => "abc123"
      })
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Last name can't be blank")

      user.last_name = "Exam"
      expect(user).to be_valid
    end

    it 'has a password of minimum length' do
      user = User.new({
        "first_name" => "Test",
        "last_name" => "Exam",
        "email" => "email@email.com",
        "password" => "1",
        "password_confirmation" => "1"
      })
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")

      user.password = "password"
      user.password_confirmation = "password"
      expect(user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should be successful with valid credentials' do
    user = User.new({
      "first_name" => "Test",
      "last_name" => "Exam",
      "email" => "email@email.com",
      "password" => "123pw",
      "password_confirmation" => "123pw"
    })
    user.save
    expect(User.authenticate_with_credentials("email@email.com", "123pw")).to eq(user)
    end
    
    it 'should fail with incorrect credentials' do
        user = User.new({
          "first_name" => "Test",
          "last_name" => "Exam",
          "email" => "email@email.com",
          "password" => "123pw",
          "password_confirmation" => "123pw"
        })
        user.save
        expect(User.authenticate_with_credentials("email@email.com", "wrongpassword")).to eq(nil)
    end

    it 'should sucessfully login user when email is typed with extra whitespaces' do
      user = User.new({
        "first_name" => "Test",
        "last_name" => "Exam",
        "email" => "email@email.com",
        "password" => "123pw",
        "password_confirmation" => "123pw"
      })
      user.save
      expect(User.authenticate_with_credentials("     email@email.com        ", "123pw")).to eq(user)
  end

    it 'should sucessfully login user when email is typed with extra whitespaces' do
      user = User.new({
       "first_name" => "Test",
        "last_name" => "Exam",
        "email" => "eMaIl@eMaIl.cOm",
        "password" => "123pw",
        "password_confirmation" => "123pw"
      })
      user.save
      expect(User.authenticate_with_credentials("EmAiL@eMaIl.CoM", "123pw")).to eq(user)
    end
  end

end
