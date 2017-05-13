require 'test_helper'

class BookTest < ActiveSupport::TestCase
	def setup
		@author = Author.create(name: "Nicholas Sparks",
							             email: "Nicholas@Sparks.com")
    @book = @author.books.build(name: "The Notebook",
							           description: "The Notebook is a contemporary love story set in the pre- and post-World War II era.")
	end

	test "book should be valid" do
		assert @book.valid?
	end

	test "author id should be present" do
    @book.author_id = nil
    assert_not @book.valid?
  end

	test "name should be present" do
		@book.name = " "
		assert_not @book.valid?
	end

	test "name length should not be too long" do
		@book.name = "a" * 101
		assert_not @book.valid?
	end

	test "name length should not be too short" do
		@book.name = "aaaa"
		assert_not @book.valid?
	end

	test "descripion should be present" do
		@book.description = " "
		assert_not @book.valid?
	end

	test "desciption length should not be too long" do
		@book.description = "a" * 501
		assert_not @book.valid?
	end

	test "desciption length should not be too short" do
		@book.description = "a" * 19
		assert_not @book.valid?
	end

end
