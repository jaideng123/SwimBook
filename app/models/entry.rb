class Entry < ActiveRecord::Base
	validates :lname, presence: true
	validates :fname, presence: true
	validates :age, presence: true
	validate :atleast_one_is_checked

  def atleast_one_is_checked
    errors.add(:base, "Select atleast one       output test type") unless pink || yellow
  end
end
