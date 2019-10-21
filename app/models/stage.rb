class Stage < ActiveRecord::Base
  has_many :kids
  has_many :toys
  has_many :stage_categories
  has_many :categories, :through => :stage_categories

  def self.make_development_stages
    self.create(:name=>"infant")
    self.create(:name=>"toddler")
    self.create(:name=>"preschool")
    self.create(:name=>"grade school")
  end

  def self.development_stages
    Stage.make_development_stages if Stage.all.empty?
    development_stages = Stage.all
  end

  # def slug
  #   name.downcase.gsub(" ","-")
  # end
  #
  # def self.find_by_slug(slug)
  #   Stage.all.find{|stage| stage.slug == slug}
  # end

 end
