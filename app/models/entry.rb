class Entry < ActiveRecord::Base
	validates :lname, presence: true
	validates :fname, presence: true
	validates :age, presence: true
	validate :pink_or_yellow
	def pink_or_yellow
	  	if self.pink == false && self.yellow = false
	   	 errors.add(:pink,"Please select a test type")
	 	end
	end   
end