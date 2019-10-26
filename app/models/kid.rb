class Kid < ActiveRecord::Base
  belongs_to :user
  belongs_to :stage
  has_many :toys
  validates :name, :stage, :user, presence: true

end
