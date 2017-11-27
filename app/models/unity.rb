class Unity < ActiveRecord::Base
  belongs_to :section
  has_many :topics
  has_many :comments
end
