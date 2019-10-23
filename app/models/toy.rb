class Toy < ActiveRecord::Base
  belongs_to :kid
  belongs_to :user
  belongs_to :stage
  has_many :toy_categories
  has_many :categories, :through => :toy_categories

 end
