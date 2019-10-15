class Toy < ActiveRecord::Base
  belongs_to :kid
  belongs_to :user
  has_many :toy_types
  has_many :types, :through => :toy_types

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Toy.all.find{|toy| toy.slug == slug}
  end
 end
