class Stage < ActiveRecord::Base
  has_many :kids
  has_many :toys
  has_many :manufacturers, :through => :toys
  has_many :stage_types
  has_many :types, :through => :stage_types




  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Stage.all.find{|stage| stage.slug == slug}
  end
 end