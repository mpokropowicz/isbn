require "minitest/autorun"
require_relative "isbn_validator.rb"

class TestISBN < Minitest::Test

	def test_removes_spaces_and_dashes

		assert_equal("0471958697", remove_spaces_and_dashes("04 7-1-9 58 69-7"))
	end

	def test_correct_checksum

		assert_equal("10", calculate_checksum("877195869x"))
	end

	def test_is_good_checksum

		assert_equal(true, correct_checksum?("0471958697"))
	end

	def test_is_valid_ISBN

		assert_equal(true, is_valid_ISBN?("9780470059029"))
	 end
end