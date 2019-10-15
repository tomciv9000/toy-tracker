class Manufacturer < ActiveRecord::Base
  has_many :toys
  has_many :stages, :through => :toys
  has_many :manufacturer_types
  has_many :types, :through => :manufacturer_types



  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Manufacturer.all.find{|manufacturer| manufacturer.slug == slug}
  end
 end
