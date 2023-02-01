class User < ApplicationRecord
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}
  

  def authenticate_with_credentials(password, email)
    # return an instance of the usser if success or nil if otherwise
  end

end
