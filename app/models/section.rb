class Section < ActiveRecord::Base
  has_many :unities, dependent: :destroy
end
