class User < ActiveRecord::Base
  has_secure_password
  has_many :kids
  has_many :toys, :through => :kids
  validates_uniqueness_of :username, :message => 'This username has already been registered'



end
