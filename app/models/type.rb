class Type < ActiveRecord::Base
  has_many :toys
  has_many :stage_types
  has_many :stages, :through => :stage_types
  has_many :manufacturer_types
  has_many :manufacturers, :through => :manufacturer_types



  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Type.all.find{|type| type.slug == slug}
  end
 end
