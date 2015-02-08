class State < ActiveRecord::Base
  belongs_to :country
  has_many :shops

  default_scope -> { order('code') }

end
