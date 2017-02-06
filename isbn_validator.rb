def remove_spaces_and_dashes(num)

	num.delete(" " "-")
end

def calculate_checksum_10(num)

	sum = 0
	index = 1
	num = num.chop

	num.each_char {|number| sum += (number.to_i * index); index += 1}
	(sum % 11).to_s
end

def calculate_checksum_13(num)

	sum = 0
	index = 0
	num = num.chop
	alternating_multiplier = [1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3]

	num.each_char {|number| sum += (number.to_i * alternating_multiplier[index]); index += 1}
	((10 - (sum % 10)) % 10).to_s
end

def correct_checksum?(num)

	if num[-1].upcase == "X" then return (calculate_checksum_10(num) == "10") end
	if num.length == 13 then return calculate_checksum_13(num) == num[-1] end
	if num.length == 10 then return calculate_checksum_10(num) == num[-1] end
end

def contains_nonvalids?(num)
 
	num.delete!("xX0123456789")

	num.length > 0 ? true : false
end

def correct_x?(num)

	num.upcase.include?("X") ? (num.upcase.index("X") == num.length - 1) : true
end

def is_valid_ISBN_10?(num)

	correct_checksum?(num) && !contains_nonvalids?(num) && correct_x?(num) ? true : false
end


def is_valid_ISBN_13?(num)

	correct_checksum?(num) && !contains_nonvalids?(num) ? true : false
end


def is_valid_ISBN?(num)

	num = remove_spaces_and_dashes(num)

	num.length == 10 ? is_valid_ISBN_10?(num) : num.length == 13 ? is_valid_ISBN_13?(num) : false
end

#puts remove_spaces_and_dashes("0471958697")
#print correct_x?("0471958697")
#print correct_checksum?("877195869x")
# puts calculate_checksum("9782207258040")
#print calculate_checksum_10("877195869x")
#print contains_nonvalids?("877195869x")
#print is_valid_ISBN?("877195869x")