class Manufacturer < ActiveRecord::Base
  has_many :toys
  has_many :stages, :through => :toys
  has_many :manufacturer_categories
  has_many :categories, :through => :manufacturer_categories

  # def self.unique_manufacturers
  #   Manufacturer.all.collect{|maker| maker.name}.uniq
  # end
  ### possible useful down the road

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Manufacturer.all.find{|manufacturer| manufacturer.slug == slug}
  end

  def self.user_created_manufacturers
    user_created_manufacturers = []
    user = User.find(session[:user_id])
    user.kid.each do |kid|
      kid.toys.each do |toy|
        user_created_manufacturers << toy.manufacturer
      end
    end
    user_created_manufacturers.uniq
  end


 end
