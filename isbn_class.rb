class ISBN

def initialize(isbn)

	@isbn = isbn
end

def get_checksum()

	sum = 0
	index = 1
	alternating_multiplyer = 1

	@isbn = @isbn.chop

	if @isbn.length == 12

		(@isbn.length - 1).times do |i|

			if alternating_multiplyer == 3

				sum += (@isbn[i].to_i * alternating_multiplyer)
				alternating_multiplyer = 1
			end

			if alternating_multiplyer == 1

				sum+= (@isbn[i].to_i * alternating_multiplyer)
				alternating_multiplyer = 3
			end
		end

		return (((sum % 10) - 10) % 10).to_s
	end

	@isbn.each_char do |number|

		sum += (number.to_i * index)
		index += 1
	end

	(sum % 11).to_s
end

def get_length

	@isbn.length
end

end