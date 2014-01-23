class Location < ActiveRecord::Base
	has_many :stories
  acts_as_mappable
end
