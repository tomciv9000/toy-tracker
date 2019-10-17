class Kid < ActiveRecord::Base
  belongs_to :user
  belongs_to :stage
  has_many :toys


### these methods were an attempt to create a slug that allowed for duplicate names
  # def slug_id
  #    name.downcase.gsub(" ","-") << "_#{id}"
  # end
  #
  # def self.find_by_slug_id(slug_id)
  #    Kid.all.find{|kid| kid.slug_id == slug_id}
  # end

end
