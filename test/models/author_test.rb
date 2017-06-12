require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
	def setup
		@author = Author.new(name: "Nicholas Sparks",
							          email: "Nicholas@Sparks.com")
	end

	test "author should be valid" do
		assert @author.valid?
	end

	test "name should be present" do
		@author.name = " "
		assert_not @author.valid?
	end

	test "name should not be too long" do
		@author.name = "a" * 41
		assert_not @author.valid?
	end

	test "name should not be too short" do
		@author.name = "aa"
		assert_not @author.valid?
	end

	test "email length should be within bounds" do
    @author.email = "a" * 101 + "@example.com"
    assert_not @author.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
    valid_addresses.each do |va|
      @author.email = va
      assert @author.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@exmaple,com user_at_eee.org user.name@example. eee@i_am_.com foo@eee+aar.com]
    invalid_addresses.each do |ia|
      @author.email = ia
      assert_not @author.valid?, '#{ia.inspect} should be invalid'
    end    
  end
end
