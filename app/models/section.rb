class Section < ActiveRecord::Base
  has_many :modules, class_name: 'Unity', dependent: :destroy
end
