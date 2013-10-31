class User < ActiveRecord::Base

  def self.authenticate?(first_name, password)
    user = User.find_by_first_name_and_password(first_name, password)
    if user.nil?
      false
    else
      true
    end
  end
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true
  # validates :password, presence: true
  # Remember to create a migration!
end
