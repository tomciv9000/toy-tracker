class User < ActiveRecord::Base
  has_secure_password
  has_many :kids
  has_many :toys, :through => :kids
  validates :username, :email, presence: true
  validates_uniqueness_of :username
end
