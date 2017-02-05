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
	alternating_multiplier = [1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3]

	num =  num.chop

	if num.length == 12

		index = 0

		num.each_char do |number|

			sum += (number.to_i * alternating_multiplier[index])
			index += 1
		end

		return ((10 - (sum % 10)) % 10).to_s
	end

	num.each_char do |number|

		sum += (number.to_i * index)
		index += 1
	end

	(sum % 11).to_s
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

def correct_x?(num)

	if num.upcase.include? "X"

		return num.upcase.index("X") == num.length - 1
	end
	
	true
end

def is_valid_ISBN_10?(num)

	if correct_checksum?(num) && !contains_nonvalids?(num) && correct_x?(num)

		return true
	end

	false
end


def is_valid_ISBN_13?(num)

	if correct_checksum?(num) && !contains_nonvalids?(num)

		return true
	end

	false
end


def is_valid_ISBN?(num)

	num = remove_spaces_and_dashes(num)

	if num.length == 10

		is_valid_ISBN_10?(num)

	elsif num.length == 13

		is_valid_ISBN_13?(num)
	else

		false
	end
end

#puts remove_spaces_and_dashes("0471958697")
#print correct_x?("0471958697")
#2print correct_checksum?("0471958697")
# puts calculate_checksum("9782207258040")
# print calculate_checksum("9780470059029")