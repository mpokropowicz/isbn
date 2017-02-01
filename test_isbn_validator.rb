require "minitest/autorun"
require_relative "isbn_validator.rb"

class TestISBN < Minitest::Test

	def test_removes_spaces_and_dashes

		assert_equal("0471958697", remove_spaces_and_dashes("04 7-1-9 58 69-7"))
	end
end