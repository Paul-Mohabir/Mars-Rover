class Rover

attr_reader :instructions
direction =["n", "e", "s", "w"]
#These are the states so they need to be altered by behaviour
#We are starting at position 0,0 where direction is n
def initialize (x = 0, y = 0, direction = "n")
  @x_coordinate = x
  @y_coordinate = y
  @direction = direction
end

def follow_cmd
  puts "Where do you want to go?
  The following commands will work. To go left type l. To go right type r.
  To move up type u. \nOR type \"exit\" to quit. "
  @follow_cmd = gets.strip.downcase
  @follow_cmd.each_char do |cmd|
		case cmd
		when "l"
		@direction = directions[directions.find_index(@direction)-1]
			when "r"
				@direction = directions[(directions.find_index(@direction)+1)%4]
      when "u"
					  move
				when "exit"
			break
		end
	end

	end

	def move
		case @direction
		when "n"
			@y_coordinate += 1
    when "e"
      @x_coordinate += 1
		when "s"
			@y_coordinate -= 1
		when "w"
			@x_coordinate -= 1
		end
	end

	def to_s
		"#{@x_coordinate}, #{@y_coordinate} -> #{@direction}"
	end

end

rover = Rover.new

while true
	rover.follow_cmd
	puts rover

	if rover.follow_cmd == "exit"
		exit
	end

end
