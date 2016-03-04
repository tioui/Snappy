note
	description: "Summary description for {LEVEL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LEVEL

inherit
	DRAWABLE

create
	make

feature {NONE} -- Initialization

	make(a_texture:GAME_TEXTURE; a_obstacles:LIST[OBSTACLE])
		do
			image := a_texture
			obstacles := a_obstacles
			x := 0
			y := 0
			angle := 0.0
		end

feature -- Access

	obstacles: LIST[OBSTACLE]

end
