class State < ActiveRecord::Base
  belongs_to :country
  has_many :shops
  has_many :state_translations

  default_scope -> { order('code') }

  translates :name

end
