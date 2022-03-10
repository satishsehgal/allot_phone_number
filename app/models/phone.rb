class Phone < ApplicationRecord

	validates :number, presence: true, uniqueness: true
	validates_length_of :number, minimum: 10, maximum: 10, allow_blank: false
end
