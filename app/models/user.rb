class User < ActiveRecord::Base
  has_secure_password
  has_many :todo_items

  validates :email, uniqueness: true
end
