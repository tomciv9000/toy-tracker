class Stage < ActiveRecord::Base
  has_many :kids
  has_many :toys
  has_many :manufacturers, :through => :toys
  has_many :stage_types
  has_many :types, :through => :stage_types

  def self.make_development_stages
    self.create(:name=>"infant")
    self.create(:name=>"toddler")
    self.create(:name=>"preschool")
    self.create(:name=>"grade school")
  end

  def self.development_stages
    Stage.make_development_stages if Stage.all.empty?
    @development_stages = Stages.all
  end

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Stage.all.find{|stage| stage.slug == slug}
  end

 end
