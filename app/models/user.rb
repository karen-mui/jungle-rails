class User < ApplicationRecord
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  

  def authenticate_with_credentials(password, email)
    # return an instance of the usser if success or nil if otherwise
  end

end
