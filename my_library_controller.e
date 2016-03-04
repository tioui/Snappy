note
	description: "Summary description for {MY_LIBRARY_CONTROLLER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MY_LIBRARY_CONTROLLER

inherit
	GAME_LIBRARY_CONTROLLER
		rename
			quit_library as rage_quit_library
		end

create
	default_create

end
