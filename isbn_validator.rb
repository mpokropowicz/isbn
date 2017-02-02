def remove_spaces_and_dashes(num)

	formatted_number = ""

	num.each_char do |letter|

		if letter != " " && letter != "-"

			formatted_number += letter
		end
	end

	formatted_number
end

def calculate_checksum(num)

	sum = 0
	index = 1

	num = num.chop

	num.each_char do |number|

		sum += (number.to_i * index)
		index += 1
	end

	return (sum % 11).to_s
end

def correct_checksum?(num)

	if num[num.length - 1].upcase == "X"

		calculate_checksum(num) == "10"
	else

		calculate_checksum(num) == num[num.length - 1]
	end
end

def contains_nonvalids?(num)

	valid_chars = "xX0123456789"
	num = num.split("")
	num_valid_chars = 0

	num.each do |e|

		if valid_chars.include? e

			num_valid_chars += 1
		end
	end

	valid_chars ==  num.length
end

def is_valid_ISBN_10?(num)

	num = remove_spaces_and_dashes(num)

	if num.length == 10 && correct_checksum?(num) && !contains_nonvalids?(num)

		return true
	else

		return false
	end
end
# # puts remove_spaces_and_dashes("0471958697")

#print is_valid_ISBN_10?("0471958697")

# #print calculate_checksum("0471958697")
