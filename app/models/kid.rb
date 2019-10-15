class Kid < ActiveRecord::Base
  belongs_to :user
  has_many :toys

  def slug
     name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
     Kid.all.find{|kid| kid.slug == slug}
   end
  end
  
end
