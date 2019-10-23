class Toy < ActiveRecord::Base
  belongs_to :kid
  belongs_to :user
  belongs_to :stage
  has_many :toy_categories
  has_many :categories, :through => :toy_categories

  # def slug
  #   name.downcase.gsub(" ","-")
  # end
  Book.joins(:genres).where("genres.name" => ["Young Adult", "Fiction", "Romance"])
  Book.joins(:genres).where("genres.name" => "Young Adult")
  #
  #
  # def self.find_by_slug(slug)
  #   Toy.all.find{|toy| toy.slug == slug}
  # end
 end
