class Book < ActiveRecord::Base
	belongs_to :author
	belongs_to :borrower
	validates :author_id, presence: true
	validates :name, presence: true, length: { minimum: 5, maximum: 100 }
	validates :description, presence: true, length: { minimum: 20, maximum: 500 }
end
