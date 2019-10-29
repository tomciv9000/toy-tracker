class Stage < ActiveRecord::Base
  has_many :kids
  has_many :toys

  def self.create_development_stages
    self.create(:name=>"Infant")
    self.create(:name=>"Toddler")
    self.create(:name=>"Pre-School")
    self.create(:name=>"Grade School")
  end

  def self.development_stages
    Stage.create_development_stages if Stage.all.empty?
    @development_stages ||= Stage.all
  end

 end
