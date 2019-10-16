class Toy < ActiveRecord::Base
  belongs_to :kid
  belongs_to :user
  belongs_to :manufacturer
  belongs_to :stage
  has_many :toy_categories
  has_many :categories, :through => :toy_categories

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.unique_manufacturers
    #Manufacturer.all.collect{|maker| maker.name}.uniq
    current_user.toys.collect{|toy| toy.manufacturer.name}.uniq
  end

  def self.find_by_slug(slug)
    Toy.all.find{|toy| toy.slug == slug}
  end
 end
