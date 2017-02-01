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

	if num[num.length - 1].upcase == "X"

		num.delete!(num[num.length - 1])
	end

	num.each_char do |number|

		sum += (number.to_i * index)
		index += 1
	end

	sum % 11
end

def correct_checksum?(num)

	if num[num.length - 1].upcase == "X"

		calculate_checksum(num) == 10
	else

		calculate_checksum(num) == num[length - 1]
	end
end