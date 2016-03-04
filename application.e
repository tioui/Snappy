note
	description : "snappy application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	GAME_LIBRARY_SHARED
	IMG_LIBRARY_SHARED

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_engine:detachable GAME_ENGINE
		do
			create {MY_LIBRARY_CONTROLLER}internal_game_library
			game_library.enable_video
			image_file_library.enable_png
			create l_engine.make
			l_engine.run
			l_engine := Void
			image_file_library.quit_library
			check attached {MY_LIBRARY_CONTROLLER} game_library as la_game_library then
				la_game_library.rage_quit_library
			end
		end

end
