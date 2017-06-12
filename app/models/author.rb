class Author < ActiveRecord::Base
	has_many :books, dependent: :destroy
	validates :name, presence: true, length: { minimum: 3, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
end
