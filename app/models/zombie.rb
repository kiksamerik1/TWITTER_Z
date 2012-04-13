class Zombie < ActiveRecord::Base
	validates :name, :presence=>true
	validates :graveyard, :presence=>true
end 