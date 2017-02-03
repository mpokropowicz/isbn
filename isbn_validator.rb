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
	alternating_multiplyer = 1

	num = num.chop

	if num.length == 12

		(num.length - 1).times do |i|

			if alternating_multiplyer == 3

				sum += (num[i].to_i * alternating_multiplyer)
				alternating_multiplyer = 1
			end

			if alternating_multiplyer == 1

				sum+= (num[i].to_i * alternating_multiplyer)
				alternating_multiplyer = 3
			end
		end

		return (((sum % 10) - 10) % 10).to_s
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

def is_valid_ISBN_10?(num)

	num = remove_spaces_and_dashes(num)

	if correct_checksum?(num) && !contains_nonvalids?(num)

		return true
	else

		return false
	end
end
# # puts remove_spaces_and_dashes("0471958697")

#print is_valid_ISBN_10?("0471958697")
#print correct_checksum?("0471958697")
#print calculate_checksum("9780470059029")
